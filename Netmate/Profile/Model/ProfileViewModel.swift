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
    let fields: [ProfileFeedMenu] = [
        ProfileFeedMenu(name: "Save to bookmarks"),
        ProfileFeedMenu(name: "Pin"),
        ProfileFeedMenu(name: "Disable comments"),
        ProfileFeedMenu(name: "Copy the link"),
        ProfileFeedMenu(name: "Archive the entry"),
        ProfileFeedMenu(name: "Delete")
    ]
}
