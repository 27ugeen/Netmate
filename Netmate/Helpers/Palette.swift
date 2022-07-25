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
    
    static let btnWithBordColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: .black)
    static let btnWithBordTitleColor = UIColor.createColor(lightMode: UIColor(rgb: 0xFFFFFF), darkMode: .black)
    static let btnNoBordTitleColor = UIColor.createColor(lightMode: UIColor(rgb: 0x1F1E1E), darkMode: .white)
    
    
    static let textFieldBorderColor = UIColor.createColor(lightMode: UIColor(rgb: 0x263238), darkMode: UIColor(rgb: 0x263238))
}
