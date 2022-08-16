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
    lazy var fields: [Menu] = [
        Menu(image: UIImage(systemName: "star"), title: bookmarks),
        Menu(image: UIImage(systemName: "heart"), title: favorite),
        Menu(image: UIImage(systemName: "square.and.arrow.up"), title: files),
        Menu(image: UIImage(systemName: "link"), title: archive)
    ]
    
    //MARK: - localization
    private let bookmarks = "bookmarks_btn".localized()
    private let favorite = "favorite_btn".localized()
    private let files = "files_btn".localized()
    private let archive = "archive_btn".localized()

}

