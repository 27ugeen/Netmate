//
//  FriendsList.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

struct User {
    let avatar: UIImage
    let firstName: String
    let lastName: String
    let nickName: String
    let profession: String
    let photo: [Photo]
    let feed: [Feed]
}

struct Feed {
    let article: String
    let image: UIImage
}

struct FriendsStorage {
    static let tableModel = [
        User(avatar: #imageLiteral(resourceName: "Margot_Robbie_2"),
             firstName: "Margot",
             lastName: "Robbie",
             nickName: "harley_quinn",
             profession: "Actress, model",
             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women")), Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "beach")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Margot_Robbie")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Margot_Robbie_1"))]),
        User(avatar: #imageLiteral(resourceName: "Elon_Mask"),
             firstName: "Elon",
             lastName: "Mask",
             nickName: "the_alien",
             profession: "FRS, business magnate and investor",
             photo: [Photo(image: #imageLiteral(resourceName: "macroperspective")), Photo(image: #imageLiteral(resourceName: "ferrari-458-spider")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "wolf")), Photo(image: #imageLiteral(resourceName: "tasmanian-devil")), Photo(image: #imageLiteral(resourceName: "palm-trees")),Photo(image: #imageLiteral(resourceName: "shoes")), Photo(image: #imageLiteral(resourceName: "sea-25")), Photo(image: #imageLiteral(resourceName: "surf-15")), Photo(image: #imageLiteral(resourceName: "road")), Photo(image: #imageLiteral(resourceName: "porsche")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "tree"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "man")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Super_heavy_rocket")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "desert"))]),
        User(avatar: #imageLiteral(resourceName: "Gal_Gadot"),
             firstName: "Gal",
             lastName: "Gadot",
             nickName: "wonder_woman",
             profession: "Actress, model",
             photo: [Photo(image: #imageLiteral(resourceName: "ladybug")), Photo(image: #imageLiteral(resourceName: "raccoon")), Photo(image: #imageLiteral(resourceName: "dog-2")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "face-painting")), Photo(image: #imageLiteral(resourceName: "boat")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "milky-way")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "the-sun"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "woman2")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "surf-15")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Gal_Gadot_2"))]),
        User(avatar: #imageLiteral(resourceName: "Neil _deGrasse _Tyson"),
             firstName: "Neil deGrasse",
             lastName: "Tyson",
             nickName: "the_scientist",
             profession: "Astrophysicist, science communicator",
             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Neil _deGrasse _Tyson")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Neil _deGrasse _Tyson")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Neil _deGrasse _Tyson"))]),
        User(avatar: #imageLiteral(resourceName: "Dwaine_Johnson"),
             firstName: "Dwaine",
             lastName: "Johnson",
             nickName: "the_rock",
             profession: "Actor, professional wrestler",
             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Dwaine_Johnson")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Dwaine_Johnson")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Dwaine_Johnson"))]),
        User(avatar: #imageLiteral(resourceName: "Anya _Chalotra"),
             firstName: "Anya",
             lastName: "Chalotra",
             nickName: "the_witch_yennefer",
             profession: "Actress",
             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Anya _Chalotra")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Anya _Chalotra")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Anya _Chalotra"))]),
        User(avatar: #imageLiteral(resourceName: "Tom_Cruise"),
             firstName: "Tom",
             lastName: "Cruise",
             nickName: "mission_imposible",
             profession: "Actor, producer",
             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Tom_Cruise")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Tom_Cruise")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Tom_Cruise"))]
            )
    ]
}

struct UserStorage {
    static let tableModel = [
        User(avatar: #imageLiteral(resourceName: "surfer"),
             firstName: "Gin",
             lastName: "Eugene",
             nickName: "gin_apple_sd",
             profession: "Apple software developer",
             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women")), Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "car2")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "G80-BMW-M3-vs-Alfa-Romeo-Giulia-Quadrifoglio-4-of-4")),
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Margot_Robbie_1"))])
    ]
}

class FeedStorage {
    static let tableModel = [
        User(avatar: #imageLiteral(resourceName: "Margot_Robbie_2"),
             firstName: "Margot",
             lastName: "Robbie",
             nickName: "harley_quinn",
             profession: "Actress, model",
             photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women")), Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Margot_Robbie_2"))]),
        User(avatar: #imageLiteral(resourceName: "Tom_Cruise"),
             firstName: "Tom",
             lastName: "Cruise",
             nickName: "mission_imposible",
             profession: "Actor, producer",
             photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "Tom_Cruise"))]),
        User(avatar: #imageLiteral(resourceName: "Gal_Gadot"),
             firstName: "Gal",
             lastName: "Gadot",
             nickName: "wonder_woman",
             profession: "Actress, model",
             photo: [Photo(image: #imageLiteral(resourceName: "ladybug")), Photo(image: #imageLiteral(resourceName: "raccoon")), Photo(image: #imageLiteral(resourceName: "dog-2")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "face-painting")), Photo(image: #imageLiteral(resourceName: "boat")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "milky-way")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "the-sun"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "strawberries"))]),
        User(avatar: #imageLiteral(resourceName: "Elon_Mask"),
             firstName: "Elon",
             lastName: "Mask",
             nickName: "the_alien",
             profession: "FRS, business magnate and investor",
             photo: [Photo(image: #imageLiteral(resourceName: "macroperspective")), Photo(image: #imageLiteral(resourceName: "ferrari-458-spider")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "wolf")), Photo(image: #imageLiteral(resourceName: "tasmanian-devil")), Photo(image: #imageLiteral(resourceName: "palm-trees")),Photo(image: #imageLiteral(resourceName: "shoes")), Photo(image: #imageLiteral(resourceName: "sea-25")), Photo(image: #imageLiteral(resourceName: "surf-15")), Photo(image: #imageLiteral(resourceName: "road")), Photo(image: #imageLiteral(resourceName: "porsche")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "tree"))],
             feed: [
                Feed(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: #imageLiteral(resourceName: "surf-15"))])
    ]
}
