//
//  FriendsList.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

struct Friend {
    let avatar: UIImage
    let firstName: String
    let lastName: String
    let photo: [Photo]
}

struct FriendsSection {
    let friends: [Friend]
}

class FriendsStorage {
    static let tableModel = [
        FriendsSection(friends: [
            Friend(avatar: #imageLiteral(resourceName: "Margot_Robbie_2"),
                   firstName: "Margot",
                   lastName: "Robbie",
                   photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women")), Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))]),
            Friend(avatar: #imageLiteral(resourceName: "Elon_Mask"),
                   firstName: "Elon",
                   lastName: "Mask",
                   photo: [Photo(image: #imageLiteral(resourceName: "macroperspective")), Photo(image: #imageLiteral(resourceName: "ferrari-458-spider")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "wolf")), Photo(image: #imageLiteral(resourceName: "tasmanian-devil")), Photo(image: #imageLiteral(resourceName: "palm-trees")),Photo(image: #imageLiteral(resourceName: "shoes")), Photo(image: #imageLiteral(resourceName: "sea-25")), Photo(image: #imageLiteral(resourceName: "surf-15")), Photo(image: #imageLiteral(resourceName: "road")), Photo(image: #imageLiteral(resourceName: "porsche")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "tree"))]),
            Friend(avatar: #imageLiteral(resourceName: "Gal_Gadot"),
                   firstName: "Gal",
                   lastName: "Gadot",
                   photo: [Photo(image: #imageLiteral(resourceName: "ladybug")), Photo(image: #imageLiteral(resourceName: "raccoon")), Photo(image: #imageLiteral(resourceName: "dog-2")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "face-painting")), Photo(image: #imageLiteral(resourceName: "boat")), Photo(image: #imageLiteral(resourceName: "girls")), Photo(image: #imageLiteral(resourceName: "milky-way")), Photo(image: #imageLiteral(resourceName: "waves")), Photo(image: #imageLiteral(resourceName: "the-sun"))]),
            Friend(avatar: #imageLiteral(resourceName: "Neil _deGrasse _Tyson"),
                   firstName: "Neil deGrasse",
                   lastName: "Tyson",
                   photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))]),
            Friend(avatar: #imageLiteral(resourceName: "Dwaine_Johnson"),
                   firstName: "Dwaine",
                   lastName: "Johnson",
                   photo: [Photo(image: #imageLiteral(resourceName: "bmw")), Photo(image: #imageLiteral(resourceName: "beach")), Photo(image: #imageLiteral(resourceName: "dog-")), Photo(image: #imageLiteral(resourceName: "ocean")), Photo(image: #imageLiteral(resourceName: "zakynthos")), Photo(image: #imageLiteral(resourceName: "cat")), Photo(image: #imageLiteral(resourceName: "woman2")), Photo(image: #imageLiteral(resourceName: "drop")),Photo(image: #imageLiteral(resourceName: "women"))]),
            Friend(avatar: #imageLiteral(resourceName: "Anya _Chalotra"),
                   firstName: "Anya",
                   lastName: "Chalotra",
                   photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))]),
            Friend(avatar: #imageLiteral(resourceName: "Tom_Cruise"),
                   firstName: "Tom",
                   lastName: "Cruise",
                   photo: [Photo(image: #imageLiteral(resourceName: "jellyfish")), Photo(image: #imageLiteral(resourceName: "smoothie")), Photo(image: #imageLiteral(resourceName: "strawberries")), Photo(image: #imageLiteral(resourceName: "girl-26")), Photo(image: #imageLiteral(resourceName: "kingfisher")), Photo(image: #imageLiteral(resourceName: "man")), Photo(image: #imageLiteral(resourceName: "sailboat")),Photo(image: #imageLiteral(resourceName: "sea-shell")), Photo(image: #imageLiteral(resourceName: "car2"))])])
    ]
}
