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
    let fields: [FeedMenu] = [
        FeedMenu(name: "Save to bookmarks"),
        FeedMenu(name: "Enable notifications"),
        FeedMenu(name: "Copy the link"),
        FeedMenu(name: "Share in..."),
        FeedMenu(name: "Unsubscribe"),
        FeedMenu(name: "Complain")
    ]
}
