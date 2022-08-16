//
//  FeedMenuViewModel.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import Foundation

struct FeedMenu {
    let name: String
}

class FeedMenuViewModel {
    //MARK: - props
    lazy var fields: [FeedMenu] = [
        FeedMenu(name: saveToBookmarks),
        FeedMenu(name: enableNotific),
        FeedMenu(name: copyTheLink),
        FeedMenu(name: shareIn),
        FeedMenu(name: unsubscribe),
        FeedMenu(name: complain)
    ]
    
    //MARK: - localization
    private let saveToBookmarks = "save_to_bookmarks_btn".localized()
    private let enableNotific = "enable_notific_btn".localized()
    private let copyTheLink = "copy_the_link_btn".localized()
    private let shareIn = "share_in_btn".localized()
    private let unsubscribe = "unsubscribe_btn".localized()
    private let complain = "complain_btn".localized()
}
