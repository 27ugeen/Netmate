//
//  ImageTitleButton.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import UIKit

final class ImgTitleButton: UIButton {
    //MARK: - props
    
//    private let onTap: () -> Void
    
    //MARK: - init
    
    init(configuration: UIButton.Configuration, title: String, titleColor: UIColor, image: UIImage?, primaryAction: UIAction? = nil) {
        super.init(frame: .zero)
        
        
        var config = configuration
        config.image = image ?? UIImage()
        config.imagePlacement = .top
        config.imagePadding = 12
        config.title = title
        config.baseForegroundColor = titleColor
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
//        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    //MARK: - methods
    
//    @objc private func buttonTapped() {
//        self.onTap()
//    }
}
