//
//  Palette.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import Foundation
import UIKit

struct Palette {
    static let appTintColor = UIColor.createColor(lightMode: .white, darkMode: .systemGray6)
    static let secondBackColor = UIColor.createColor(lightMode: UIColor(rgb: 0xF5F3EE), darkMode: .darkGray)
    static let mainTextColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .white)
    static let secondTextColor = UIColor.createColor(lightMode: UIColor(rgb: 0x7E8183), darkMode: .lightGray)
    static let accentTextColor = UIColor.createColor(lightMode: UIColor(rgb: 0xF69707), darkMode: UIColor(rgb: 0xF69707))
    static let linkTextcolor = UIColor.createColor(lightMode: UIColor(rgb: 0x0863EB), darkMode: UIColor(rgb: 0x0863EB))
    
    static let separatorColor = UIColor.createColor(lightMode: UIColor(rgb: 0x7E8183), darkMode: UIColor(rgb: 0x7E8183))
    static let btnWithBordColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .darkGray)
    static let btnWithBordTitleColor = UIColor.createColor(lightMode: UIColor(rgb: 0xFFFFFF), darkMode: UIColor(rgb: 0xF69707))
    static let btnNoBordTitleColor = UIColor.createColor(lightMode: UIColor(rgb: 0x1F1E1E), darkMode: .white)
    
    static let textFieldBorderColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .white)
}
