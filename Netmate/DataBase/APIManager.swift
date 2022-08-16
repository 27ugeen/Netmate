//
//  APIManager.swift
//  Netmate
//
//  Created by GiN Eugene on 9/8/2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class APIManager {
    //MARK: - props
    static let shared = APIManager()
    
    //MARK: - methods
    private func configFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getFeedCollection(collection: String, completion: @escaping ([Feed?]) -> Void) {
        let db = configFB()
        db.collection(collection).getDocuments { querySnapshot, error in
            guard error == nil else { completion([]); return}
            var feedArr: [Feed] = []
            querySnapshot?.documents.forEach { data in
                let newFeed = Feed(userId: data.get("userId") as! String,
                                   uAvatar: data.get("avatar") as! String,
                                   uName: data.get("name") as! String,
                                   uProf: data.get("prof") as! String,
                                   article: data.get("article") as! String,
                                   image: data.get("image") as! String)
                feedArr.append(newFeed)
            }
            completion(feedArr)
        }
    }
    
    func getFriendCollection(collection: String, completion: @escaping ([Friend?]) -> Void) {
        let db = configFB()
        db.collection(collection).getDocuments { querySnapshot, error in
            guard error == nil else { completion([]); return}
            var friendArr: [Friend] = []
            querySnapshot?.documents.forEach { data in
                let newFriend = Friend(userId: data.get("userId") as! String,
                                       avatar: data.get("avatar") as! String)
                friendArr.append(newFriend)
            }
            completion(friendArr)
        }
    }
    
    func getUser(collection: String, docName: String, completion: @escaping (User?) -> Void) {
        let db = configFB()
        db.collection(collection).document(docName).getDocument(completion: { (uData, error) in
            guard error == nil else { completion(nil); return}
            
            if let user = uData {
                
                let feedDict = user.get("feeds") as! NSDictionary
                let feedArr = feedDict.allValues as! [Array<String>]
                
                var newFeedArr: [Feed] = []
                feedArr.forEach { el in
                    newFeedArr.append(Feed(userId: user.get("id") as! String,
                                           uAvatar: user.get("avatar") as! String,
                                           uName: user.get("nickName") as! String,
                                           uProf: user.get("profession") as! String,
                                           article: el[0],
                                           image: el[1]))
                }
                
                let photoArr = user.get("photo") as! [String]
                var newPhotoArr: [Photo] = []
                photoArr.forEach { el in
                    newPhotoArr.append(Photo(userId: user.get("id") as! String, photo: el))
                }
                
                let curUser = User(id: user.get("id") as! String,
                                   avatar: user.get("avatar") as! String,
                                   firstName: user.get("firstName") as! String,
                                   lastName: user.get("lastName") as! String,
                                   nickName: user.get("nickName") as! String,
                                   profession: user.get("profession") as! String,
                                   feeds: newFeedArr,
                                   photo: newPhotoArr)
                completion(curUser)
            }
        })
    }
    
    func getImage(collName: String, picName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child(collName)
        
        var image: UIImage = UIImage(named: "default_pic")!
        
        let fileRef = pathRef.child(picName + ".jpeg")
        fileRef.getData(maxSize: 2600*3600, completion: { data, error in
            guard error == nil else { completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        })
    }
}
