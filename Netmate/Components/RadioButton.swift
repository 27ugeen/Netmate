//
//  RadioButton.swift
//  Netmate
//
//  Created by GiN Eugene on 29/7/2022.
//

import UIKit

final class RadioButtonView: UIView {
    //MARK: - props
    private let onTap: () -> Void
    
    private let imgWidth: Double
    private let imgHeight: Double
    private let imgPadding: Double
    
    //MARK: - subviews
    private let radioView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let radioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let radioImageView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        return iView
    }()
    
    let radioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init
    init(title: String, titleColor: UIColor, titleFont: UIFont, isSelected: Bool, imgSize: CGSize, imgPadding: Double, onTap: @escaping () -> Void) {
        self.onTap = onTap
        self.imgPadding = imgPadding
        self.imgWidth = imgSize.width
        self.imgHeight = imgSize.height
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.radioLabel.text = title
        self.radioLabel.textColor = titleColor
        self.radioLabel.font = titleFont
        
        self.radioButton.isSelected = isSelected
        self.radioButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    //MARK: - methods
    @objc private func buttonTapped() {
        self.onTap()
    }
    
    private func setupView() {
        addSubview(radioView)
        radioView.addSubview(radioButton)
        radioView.addSubview(radioImageView)
        radioView.addSubview(radioLabel)
        
        NSLayoutConstraint.activate([
            radioView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            radioView.topAnchor.constraint(equalTo: self.topAnchor),
            radioView.widthAnchor.constraint(equalTo: self.widthAnchor),
            radioView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            radioButton.leadingAnchor.constraint(equalTo: radioView.leadingAnchor),
            radioButton.topAnchor.constraint(equalTo: radioView.topAnchor),
            radioButton.trailingAnchor.constraint(equalTo: radioView.trailingAnchor),
            radioButton.bottomAnchor.constraint(equalTo: radioView.bottomAnchor),

            radioImageView.centerYAnchor.constraint(equalTo: radioView.centerYAnchor),
            radioImageView.leadingAnchor.constraint(equalTo: radioView.leadingAnchor),
            radioImageView.heightAnchor.constraint(equalToConstant: imgHeight),
            radioImageView.widthAnchor.constraint(equalToConstant: imgWidth),
            
            radioLabel.centerYAnchor.constraint(equalTo: radioView.centerYAnchor),
            radioLabel.leadingAnchor.constraint(equalTo: radioImageView.trailingAnchor, constant: imgPadding)
        ])
    }
}
