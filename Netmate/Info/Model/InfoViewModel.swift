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
    lazy var fields: [Info] = [
        Info(name: generalInfo),
        Info(name: contacts),
        Info(name: interests),
        Info(name: education),
        Info(name: career)
    ]
    
    //MARK: - localization
    private let generalInfo = "general_info_btn".localized()
    private let contacts = "contacts_btn".localized()
    private let interests = "interests_btn".localized()
    private let education = "education_btn".localized()
    private let career = "career_btn".localized()
}

