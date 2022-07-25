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
    static let mainTextColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .white)
    static let secondTextColor = UIColor.createColor(lightMode: UIColor(rgb: 0x7E8183), darkMode: .lightGray)
    static let accentTextColor = UIColor.createColor(lightMode: UIColor(rgb: 0xF69707), darkMode: .white)
    
    static let btnWithBordColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .darkGray)
    static let btnWithBordTitleColor = UIColor.createColor(lightMode: UIColor(rgb: 0xFFFFFF), darkMode: UIColor(rgb: 0xF69707))
    static let btnNoBordTitleColor = UIColor.createColor(lightMode: UIColor(rgb: 0x1F1E1E), darkMode: .white)
    
    
    static let textFieldBorderColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .white)
}
