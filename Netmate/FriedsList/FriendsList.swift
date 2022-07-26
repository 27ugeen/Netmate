//
//  FriendsList.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

struct Friend {
    let photo: UIImage
}

struct FriendsSection {
    let friends: [Friend]
}

class FriendsStorage {
    static let tableModel = [
        FriendsSection(friends: [
            Friend(photo: #imageLiteral(resourceName: "Margot_Robbie")),
            Friend(photo: #imageLiteral(resourceName: "Elon_Mask")),
            Friend(photo: #imageLiteral(resourceName: "Gal_Gadot")),
            Friend(photo: #imageLiteral(resourceName: "Neil _deGrasse _Tyson")),
            Friend(photo: #imageLiteral(resourceName: "Dwaine_Johnson")),
            Friend(photo: #imageLiteral(resourceName: "Anya _Chalotra")),
            Friend(photo: #imageLiteral(resourceName: "Tom_Cruise"))])
    ]
}
