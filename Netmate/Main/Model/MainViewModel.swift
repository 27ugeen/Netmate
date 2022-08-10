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
    let photo: [Photo]
    let feed: [FeedStub]
}

struct FeedStub {
    let article: String
    let image: UIImage
}

protocol MainViewModelInputProtocol {
    func addToFavoriteFeed(_ feed: FeedStub, _ user: UserStub, completition: @escaping (String?) -> Void)
}

class MainViewModel: MainViewModelInputProtocol {
    
    var feedStorage: [UserStub] = []
    
    func getAllUsers(completion: @escaping (UserStub) -> Void) {
        APIManager.shared.getAllUsers(collection: "users") { users in
            
            users.forEach { data in
                var userAvatar: UIImage?
                var feedArr: [FeedStub] = []
                if let user = data {
                    
                    let group = DispatchGroup()
                    group.enter()
                    APIManager.shared.getImage(picName: user.avatar) { pic in
                        userAvatar = pic
                        group.leave()
                    }
                    
                    group.enter()
                    user.feeds.forEach { feed in
                        APIManager.shared.getPostImgs(picName: feed.image) { img in
                            let newFeed = FeedStub(article: feed.article, image: img)
                            feedArr.append(newFeed)
                        }
                    }
                    group.leave()
                    
                    group.notify(queue: .main) {
                        let newUser = UserStub(avatar: userAvatar ?? UIImage(), firstName: user.firstName, lastName: user.lastName, nickName: user.nickName, profession: user.profession, photo: [], feed: feedArr)
                        self.feedStorage.append(newUser)
                        completion(newUser)
                        print("USER=====: \(newUser)")
                    }
                }
            }
        }
        print("UA: \(feedStorage)")
    }
    
    func addToFavoriteFeed(_ feed: FeedStub, _ user: UserStub, completition: @escaping (String?) -> Void) {
        DataBaseManager.shared.addFeed(feed, user) { message in
            DispatchQueue.main.async {
                completition(message)
            }
        }
    }
}
