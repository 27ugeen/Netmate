//
//  FriendsList.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

struct User {
    let id: String
    let avatar: String
    let firstName: String
    let lastName: String
    let nickName: String
    let profession: String
    let feeds: [Feed]
    let photo: [Photo]
}

struct Feed {
    let userId: String
    let uAvatar: String
    let uName: String
    let uProf: String
    let article: String
    let image: String
}

struct Friend {
    let userId: String
    let avatar: String
}

struct Photo {
    let userId: String
    let photo: String
    
}

struct UserStorage {
    static var tableModel = [
        UserStub(avatar: #imageLiteral(resourceName: "surfer"),
                 firstName: "Gin",
                 lastName: "Eugene",
                 nickName: "gin_apple_sd",
                 profession: "Apple software developer",
                 photo: [PhotoStub(photo: #imageLiteral(resourceName: "bmw")), PhotoStub(photo: #imageLiteral(resourceName: "beach")), PhotoStub(photo: #imageLiteral(resourceName: "dog-")), PhotoStub(photo: #imageLiteral(resourceName: "ocean")), PhotoStub(photo: #imageLiteral(resourceName: "zakynthos")), PhotoStub(photo: #imageLiteral(resourceName: "cat")), PhotoStub(photo: #imageLiteral(resourceName: "woman2")), PhotoStub(photo: #imageLiteral(resourceName: "drop")), PhotoStub(photo: #imageLiteral(resourceName: "women")), PhotoStub(photo: #imageLiteral(resourceName: "jellyfish")), PhotoStub(photo: #imageLiteral(resourceName: "smoothie")), PhotoStub(photo: #imageLiteral(resourceName: "strawberries")), PhotoStub(photo: #imageLiteral(resourceName: "girl-26")), PhotoStub(photo: #imageLiteral(resourceName: "kingfisher")), PhotoStub(photo: #imageLiteral(resourceName: "man")), PhotoStub(photo: #imageLiteral(resourceName: "sailboat")), PhotoStub(photo: #imageLiteral(resourceName: "sea-shell")), PhotoStub(photo: #imageLiteral(resourceName: "car2"))],
                 feed: [
                    FeedStub(userId: "owner", avatar: #imageLiteral(resourceName: "surfer"), name: "Gin", prof: "apple developer", article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "bmw").filterOn(.chrome)),
                    FeedStub(userId: "owner", avatar: #imageLiteral(resourceName: "surfer"), name: "Gin", prof: "apple developer", article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "man").filterOn(.fade)),
                    FeedStub(userId: "owner", avatar: #imageLiteral(resourceName: "surfer"), name: "Gin", prof: "apple developer", article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "the-sun").filterOn(.sepia(intensity: 0.5))),
                    FeedStub(userId: "owner", avatar: #imageLiteral(resourceName: "surfer"), name: "Gin", prof: "apple developer", article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Dwaine_Johnson").filterOn(.posterize)),])
    ]
}
