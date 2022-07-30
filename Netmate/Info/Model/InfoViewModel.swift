//
//  InfoModel.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import Foundation

struct Info {
    let name: String
    let value: String
}

class InfoViewModel {
    //MARK: - props
    let fields: [Info] = [
        Info(name: "First name:", value: "Gin"),
        Info(name: "Last name:", value: "Eugene"),
        Info(name: "Sex:", value: "Male"),
        Info(name: "Profession:", value: "Developer"),
        Info(name: "Date of birth:", value: "10.03.2022"),
        Info(name: "City", value: "Irpin")
    ]
}

