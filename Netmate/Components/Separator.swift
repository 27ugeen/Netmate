//
//  Separator.swift
//  Netmate
//
//  Created by GiN Eugene on 31/7/2022.
//

import UIKit

final class Separator: UIImageView {
    //MARK: - init
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        nil
    }
}
