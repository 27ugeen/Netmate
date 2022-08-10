//
//  FollowerViewModel.swift
//  Netmate
//
//  Created by GiN Eugene on 10/8/2022.
//

import Foundation
import UIKit

class FollowerViewModel {
    
    func getUser(userId: String, completion: @escaping (UserStub) -> Void) {
        APIManager.shared.getUser(collection: "users", docName: userId) { data in
            var userAvatar: UIImage?
            var feedArr: [FeedStub] = []
            var photoArr: [PhotoStub] = []
            
            if let user = data {
                let group = DispatchGroup()
                
                group.enter()
                APIManager.shared.getImage(collName: "avatars", picName: user.avatar) { pic in
                    userAvatar = pic
                    group.leave()
                }
                
                user.feeds.forEach { feed in
                    group.enter()
                    APIManager.shared.getImage(collName: "postImgs", picName: feed.image) { img in
                        let newFeed = FeedStub(userId: feed.userId, avatar: (userAvatar ?? UIImage(named: "default_pic"))!, name: feed.uName, prof: feed.uProf, article: feed.article, image: img)
                        feedArr.append(newFeed)
                        group.leave()
                    }
                }
                
                user.photo.forEach { photo in
                    group.enter()
                    APIManager.shared.getImage(collName: "photo", picName: photo.photo) { pic in
                        let newPhoto = PhotoStub(photo: pic)
                        photoArr.append(newPhoto)
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                    let newUser = UserStub(avatar: userAvatar ?? UIImage(),
                                           firstName: user.firstName,
                                           lastName: user.lastName,
                                           nickName: user.nickName,
                                           profession: user.profession,
                                           photo: photoArr,
                                           feed: feedArr)
                    completion(newUser)
                }
            }
        }
    }
}
