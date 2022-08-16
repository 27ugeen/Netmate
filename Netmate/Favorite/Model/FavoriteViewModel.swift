//
//  FavoriteViewModel.swift
//  Netmate
//
//  Created by GiN Eugene on 5/8/2022.
//

import Foundation
import UIKit

protocol FavoriteViewModelOutputProtocol {
    func getAllFavoriteFeed()
    func getFilteredFeed(author: String)
}

struct FavoriteFeedStub: Equatable {
    let author: String
    let authorProf: String
    let avatar: UIImage
    let image: UIImage
    let article: String
}

class FavoriteViewModel: FavoriteViewModelOutputProtocol {
    //MARK: - props
    var favoriteFeed: [FavoriteFeedStub] = []
    var filteredFeed: [FavoriteFeedStub] = []
    
    //MARK: - methods
    func getAllFavoriteFeed() {
        let feedArray = DataBaseManager.shared.getAllFeed()
        
        favoriteFeed = []
        for feed in feedArray {
            if let uFeed = feed {
                
                let newAvatar = DataBaseManager.shared.getImageFromDocuments(imageUrl: URL(string: uFeed.stringAvatar ?? "") ?? URL(fileURLWithPath: ""))
                
                let newFeedImage = DataBaseManager.shared.getImageFromDocuments(imageUrl: URL(string: uFeed.stringImage ?? "") ?? URL(fileURLWithPath: ""))
                
                let newFeed = FavoriteFeedStub(author: uFeed.author ?? "",
                                               authorProf: uFeed.authorProf ?? "",
                                               avatar: newAvatar ?? UIImage(),
                                               image: newFeedImage ?? UIImage(),
                                               article: uFeed.article ?? "")
                favoriteFeed.append(newFeed)
            }
        }
    }
    
    func removeFeedFromFavorite(feed: FavoriteFeedStub, index: Int) {
        DataBaseManager.shared.deleteFeed(favFeed: feed)
        favoriteFeed.remove(at: index)
    }
    
    func getFilteredFeed(author: String) {
        self.getAllFavoriteFeed()
        
        filteredFeed = []
        favoriteFeed.forEach {
            if $0.author == author {
                filteredFeed.append($0)
            }
        }
        
        if filteredFeed.count > 0 {
            favoriteFeed = filteredFeed
        } else {
            favoriteFeed = []
            print("No such author found")
        }
    }
}
