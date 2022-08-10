//
//  MainViewModel.swift
//  Netmate
//
//  Created by GiN Eugene on 5/8/2022.
//

import Foundation
import UIKit

struct UserStub {
    let avatar: UIImage
    let firstName: String
    let lastName: String
    let nickName: String
    let profession: String
    let photo: [PhotoStub]
    let feed: [FeedStub]
}

struct FriendStub {
    let userId: String
    let avatar: UIImage
}

struct FeedStub {
    let userId: String
    let avatar: UIImage
    let name: String
    let prof: String
    let article: String
    let image: UIImage
}

struct PhotoStub {
    let photo: UIImage
}

protocol MainViewModelInputProtocol {
    func addToFavoriteFeed(_ feed: FeedStub, completition: @escaping (String?) -> Void)
}

class MainViewModel: MainViewModelInputProtocol {
    
    func getFeedCollection(completion: @escaping (FeedStub) -> Void) {
        APIManager.shared.getFeedCollection(collection: "feeds") { arr in
            arr.forEach { data in
                if let feed = data {
                    var feedImg: UIImage?
                    var uAvatar: UIImage?
                    
                    let group = DispatchGroup()
                    
                    group.enter()
                    APIManager.shared.getImage(collName: "postImgs", picName: feed.image) { pic in
                        feedImg = pic
                        group.leave()
                    }
                    group.enter()
                    APIManager.shared.getImage(collName: "avatars", picName: feed.uAvatar) { pic in
                        uAvatar = pic
                        group.leave()
                    }
                    
                    group.notify(queue: .main) {
                        let newFeed = FeedStub(userId: feed.userId, avatar: uAvatar ?? UIImage(named: "default_pic")!, name: feed.uName, prof: feed.uProf, article: feed.article, image: feedImg ?? UIImage(named: "default_pic")!)
                        completion(newFeed)
                    }
                }
            }
        }
    }
    
    func getFriendCollection(completion: @escaping (FriendStub) -> Void) {
        APIManager.shared.getFriendCollection(collection: "friends") { arr in
            arr.forEach { data in
                if let friend = data {
                    APIManager.shared.getImage(collName: "avatars", picName: friend.avatar) { pic in
                        let newFriend = FriendStub(userId: friend.userId, avatar: pic)
                        completion(newFriend)
                    }
                }
            }
        }
    }
    
    func addToFavoriteFeed(_ feed: FeedStub, completition: @escaping (String?) -> Void) {
        DataBaseManager.shared.addFeed(feed) { message in
            DispatchQueue.main.async {
                completition(message)
            }
        }
    }
}
