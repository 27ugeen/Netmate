//
//  InfoModel.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import Foundation

struct Info {
    let name: String
}

class InfoViewModel {
    //MARK: - props
    let fields: [Info] = [
        Info(name: "General information"),
        Info(name: "Contacts"),
        Info(name: "Interests"),
        Info(name: "Education"),
        Info(name: "Career")
    ]
}

