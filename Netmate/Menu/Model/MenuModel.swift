//
//  ProfileSettingsModel.swift
//  Netmate
//
//  Created by GiN Eugene on 30/7/2022.
//

import Foundation
import UIKit

struct Menu {
    let image: UIImage!
    let title: String
}

class MenuViewModel {
    //MARK: - props
    let fields: [Menu] = [
        Menu(image: UIImage(systemName: "star"), title: "Bookmarks"),
        Menu(image: UIImage(systemName: "heart"), title: "Favorite"),
        Menu(image: UIImage(systemName: "square.and.arrow.up"), title: "Files"),
        Menu(image: UIImage(systemName: "link"), title: "Archive")
    ]
}

