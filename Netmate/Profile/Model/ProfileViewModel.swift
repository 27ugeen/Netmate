//
//  ProfileViewModel.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import Foundation

struct ProfileFeedMenu {
    let name: String
}

class ProfileViewModel {
    //MARK: - props
    lazy var fields: [ProfileFeedMenu] = [
        ProfileFeedMenu(name: saveToBookmarks),
        ProfileFeedMenu(name: pin),
        ProfileFeedMenu(name: disableComments),
        ProfileFeedMenu(name: copyTheLink),
        ProfileFeedMenu(name: archiveTheEntry),
        ProfileFeedMenu(name: delete)
    ]
    
    //MARK: - localization
    private let saveToBookmarks = "save_to_bookmarks_btn".localized()
    private let pin = "pin_btn".localized()
    private let disableComments = "disable_comments_btn".localized()
    private let copyTheLink = "copy_the_link_btn".localized()
    private let archiveTheEntry = "archive_the_entry_btn".localized()
    private let delete = "delete_btn".localized()
}
