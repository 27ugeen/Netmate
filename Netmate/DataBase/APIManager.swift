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
    
    static let shared = APIManager()
    
    private func configFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getAllUsers(collection: String, completion: @escaping ([User?]) -> Void) {
        let db = configFB()
        db.collection(collection).getDocuments(completion: { querySnapshot, error in
            guard error == nil else { completion([]); return}
            var usersArr: [User] = []
            querySnapshot?.documents.forEach { data in
                let feedsDict = data.get("feeds") as! NSDictionary
                let feeds = feedsDict.allValues as! [Array<String>]
                var feedsArr: [Feed] = []
                
                feeds.forEach { el in
                    feedsArr.append(Feed(article: el[0], image: el[1]))
                }
                
                let newUser = User(avatar: data.get("avatar") as! String,
                                        firstName: data.get("firstName") as! String,
                                        lastName: data.get("lastName") as! String,
                                        nickName: data.get("nickName") as! String,
                                        profession: data.get("profession") as! String,
                                        feeds: feedsArr)
                usersArr.append(newUser)
            }
            completion(usersArr)
        })
    }
    
//    func getUser(collection: String, docName: String, completion: @escaping (UserStub?) -> Void) {
//        let db = configFB()
//
//        db.collection(collection).document(docName).getDocument(completion: { (uData, error) in
//            guard error == nil else { completion(nil); return}
//
//            let feedDict = uData?.get("feeds") as! NSDictionary
//            let feedArr = feedDict.allValues as! [Array<String>]
//            var feedStubArr: [FeedStub] = []
//            feedArr.forEach { el in
//                feedStubArr.append(FeedStub(article: el[0], image: el[1]))
//            }
//
//            let userStub = UserStub(avatar: uData?.get("avatar") as! String,
//                                    firstName: uData?.get("firstName") as! String,
//                                    lastName: uData?.get("lastName") as! String,
//                                    nickName: uData?.get("nickName") as! String,
//                                    profession: uData?.get("profession") as! String,
//                                    feeds: feedStubArr)
//            completion(userStub)
//
//        })
//    }
    
    func getImage(picName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("avatars")
        
        var image: UIImage = UIImage(named: "default_pic")!
        
        let fileRef = pathRef.child(picName + ".jpeg")
        fileRef.getData(maxSize: 2600*3600, completion: { data, error in
            guard error == nil else { completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        })
        
    }
    
    func getPostImgs(picName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("postImgs")
        
        var image: UIImage = UIImage(named: "default_pic")!
        
        let fileRef = pathRef.child(picName + ".jpeg")
        fileRef.getData(maxSize: 2600*3600, completion: { data, error in
            guard error == nil else { completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        })
        
    }
}
