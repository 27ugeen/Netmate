//
//  DataBaseManager.swift
//  Netmate
//
//  Created by GiN Eugene on 5/8/2022.
//

import Foundation
import UIKit
import CoreData

class DataBaseManager {
    //MARK: - props
    static let shared = DataBaseManager()
    //Create container
    private let persistentContainer: NSPersistentContainer
    private lazy var backgroundContext = persistentContainer.newBackgroundContext()
    
    //MARK: - init
    init() {
        let container = NSPersistentContainer(name: "DataBaseModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        self.persistentContainer = container
    }
    //MARK: - methods
    func getAllFeed() -> [FavoriteFeed?] {
        let fetchRequest = FavoriteFeed.fetchRequest()
        var favoriteFeedArray: [FavoriteFeed]?
        do {
            favoriteFeedArray = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return favoriteFeedArray ?? []
    }
    
    func addFeed(_ feed: FeedStub, completition: @escaping (String?) -> Void) {
        backgroundContext.perform { [weak self] in
            guard let self = self else { completition(nil); return }
            let fetchRequest = FavoriteFeed.fetchRequest()
            
            do {
                let settings = try self.backgroundContext.fetch(fetchRequest)
                
                if settings.contains(where:  { $0.article?.prefix(10) == feed.article.prefix(10) }) {
                    completition("This post has already been added!")
                    print("This post has already been added!")
                } else {
                    if let newSet = NSEntityDescription.insertNewObject(forEntityName: "FavoriteFeed", into: self.backgroundContext) as? FavoriteFeed {
                        newSet.author = feed.name
                        newSet.authorProf = feed.prof
                        newSet.article = feed.article
                        newSet.stringAvatar = self.saveImageToDocuments(chosenImage: feed.avatar)
                        newSet.stringImage = self.saveImageToDocuments(chosenImage: feed.image)
                        
                        try self.backgroundContext.save()
                        completition(nil)
                        print("Post has been added!")
                    } else {
                        completition(nil)
                        fatalError("Unable to insert FavoritePost entity")
                    }
                }
            } catch let error as NSError {
                completition(nil)
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFeed(favFeed: FavoriteFeedStub) {
        let fetchRequest = FavoriteFeed.fetchRequest()
        
        do {
            let feedArr = try persistentContainer.viewContext.fetch(fetchRequest)
            feedArr.forEach {
                if ($0.article?.prefix(10) == favFeed.article.prefix(10)) {
                    persistentContainer.viewContext.delete($0)
                    deleteImageFromDocuments(imageUrl: URL(string: $0.stringAvatar ?? "") ?? URL(fileURLWithPath: ""))
                    deleteImageFromDocuments(imageUrl: URL(string: $0.stringImage ?? "") ?? URL(fileURLWithPath: ""))
                    print("Feed \"\($0.article?.prefix(10) ?? "")\" has been removed from favorites")
                }
            }
            try persistentContainer.viewContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
// MARK: - FileManager func
extension DataBaseManager {
    func saveImageToDocuments(chosenImage: UIImage) -> String? {
        let imageData = chosenImage.jpegData(compressionQuality: .zero)
        
        do {
            let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            let fileUrl = documentsUrl.appendingPathComponent(String.random())
            FileManager.default.createFile(atPath: fileUrl.path, contents: imageData, attributes: nil)
            return String(describing: fileUrl)
        }
        catch let error as NSError {
            print("Error is: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getImageFromDocuments(imageUrl: URL) -> UIImage? {
        do {
            let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            let fileUrl = documentsUrl.appendingPathComponent(imageUrl.lastPathComponent)
            if FileManager.default.fileExists(atPath: fileUrl.path) {
                do {
                    let imageData = try Data(contentsOf: fileUrl)
                    let image = UIImage(data: imageData)
                    return image
                } catch let error as NSError {
                    print("Error is: \(error.localizedDescription)")
                }
            } else {
                print("not found")
            }
        }
        catch let error as NSError {
            print("Error is: \(error.localizedDescription)")
        }
        return nil
    }
    
    func deleteImageFromDocuments(imageUrl: URL) {
        do {
            let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            let fileUrl = documentsUrl.appendingPathComponent(imageUrl.lastPathComponent)
            if FileManager.default.fileExists(atPath: fileUrl.path) {
                do {
                    try FileManager.default.removeItem(at: fileUrl)
                } catch let error as NSError {
                    print("Error is: \(error.localizedDescription)")
                }
            } else {
                print("not found")
            }
        }
        catch let error as NSError {
            print("Error is: \(error.localizedDescription)")
        }
    }
}
