//
//  ProfileEditViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import UIKit

class ProfileEditViewController: UIViewController {
    //MARK: - props
    
    //MARK: - subviews
    private lazy var leftButton: UIButton = MagicButton(title: "", titleColor: Palette.appTintColor) {
        print("edit left button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    private lazy var rightButton: UIButton = MagicButton(title: "", titleColor: Palette.appTintColor) {
        print("edit right button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    private let testButton = MagicButton(title: "Test", titleColor: Palette.mainTextColor) {
        print("edit testButton tapped")
    }
    
    let radioView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(16)
        label.text = "Main information"
        return label
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(12)
        label.text = "First name"
        return label
    }()
    
    private lazy var firstTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.secondBackColor
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(12)
        text.tintColor = Palette.secondTextColor
        text.autocapitalizationType = .none
        text.placeholder = "First name"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.textAlignment = .left
        return text
    }()
    
    private lazy var lastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(12)
        label.text = "Last name"
        return label
    }()
    
    private lazy var lastTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.secondBackColor
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(12)
        text.tintColor = Palette.secondTextColor
        text.autocapitalizationType = .none
        text.placeholder = "Last name"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.textAlignment = .left
        return text
    }()
    
    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(12)
        label.text = "Sex"
        return label
    }()
    
    private lazy var male = RadioButtonView(title: "Male", titleColor: Palette.mainTextColor, titleFont: UIFont.setMedFont(12), isSelected: true, imgSize: CGSize(width: 16, height: 16), imgPadding: 14) {
        self.onRadioButtonTap(0)
    }
    
    private lazy var female = RadioButtonView(title: "Female", titleColor: Palette.mainTextColor, titleFont: UIFont.setMedFont(12), isSelected: false, imgSize: CGSize(width: 16, height: 16), imgPadding: 14) {
        self.onRadioButtonTap(1)
    }
    
    private lazy var birthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(12)
        label.text = "Birth date"
        return label
    }()
    
    private lazy var birthTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.secondBackColor
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(12)
        text.tintColor = Palette.secondTextColor
        text.autocapitalizationType = .none
        text.placeholder = "10.03.2022"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.textAlignment = .left
        return text
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(12)
        label.text = "City name"
        return label
    }()
    
    private lazy var cityTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.secondBackColor
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(12)
        text.tintColor = Palette.secondTextColor
        text.autocapitalizationType = .none
        text.placeholder = "Write the name"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.textAlignment = .left
        return text
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
        setupViews()
    }
    //MARK: - methods
    private func onRadioButtonTap(_ sender: Int) {
        if sender == 0 {
            mSelected()
        } else {
            fSelected()
        }
    }
    
    private func mSelected() {
        male.radioImageView.backgroundColor = Palette.appTintColor
        male.radioImageView.image = UIImage(systemName: "record.circle")
        male.radioImageView.tintColor = Palette.accentTextColor
        
        female.radioImageView.backgroundColor = Palette.appTintColor
        female.radioImageView.image = UIImage(systemName: "circle")
        female.radioImageView.tintColor = Palette.mainTextColor
    }
    
    private func fSelected() {
        male.radioImageView.backgroundColor = Palette.appTintColor
        male.radioImageView.image = UIImage(systemName: "circle")
        male.radioImageView.tintColor = Palette.mainTextColor
        
        female.radioImageView.backgroundColor = Palette.appTintColor
        female.radioImageView.image = UIImage(systemName: "record.circle")
        female.radioImageView.tintColor = Palette.accentTextColor
    }
    
    private func setupButtons() {
        if male.radioButton.isSelected {
            mSelected()
        } else {
            fSelected()
        }
        
        leftButton.setBackgroundImage(UIImage(named: "cancel"), for: .normal)
        
        rightButton.setBackgroundImage(UIImage(named: "checkMark"), for: .normal)
    }

}
//MARK: - setupViews
extension ProfileEditViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.appTintColor
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(leftButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(rightButton)
        self.view.addSubview(firstLabel)
        self.view.addSubview(firstTextField)
        self.view.addSubview(lastLabel)
        self.view.addSubview(lastTextField)
        
        self.view.addSubview(sexLabel)
        self.view.addSubview(male)
        self.view.addSubview(female)
        
        self.view.addSubview(birthLabel)
        self.view.addSubview(birthTextField)
        self.view.addSubview(cityLabel)
        self.view.addSubview(cityTextField)
        
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            leftButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 24),
            leftButton.heightAnchor.constraint(equalTo: leftButton.widthAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            
            rightButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rightButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            rightButton.widthAnchor.constraint(equalToConstant: 22.5),
            rightButton.heightAnchor.constraint(equalToConstant: 26.5),
            
            firstLabel.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            firstLabel.topAnchor.constraint(equalTo: leftButton.bottomAnchor,constant: 29),
            
            firstTextField.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            firstTextField.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 6),
            firstTextField.trailingAnchor.constraint(equalTo: rightButton.trailingAnchor),
            firstTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastLabel.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            lastLabel.topAnchor.constraint(equalTo: firstTextField.bottomAnchor,constant: 14),
            
            lastTextField.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            lastTextField.topAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 6),
            lastTextField.trailingAnchor.constraint(equalTo: rightButton.trailingAnchor),
            lastTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sexLabel.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            sexLabel.topAnchor.constraint(equalTo: lastTextField.bottomAnchor, constant: 14),
            
            male.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            male.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 11),
            male.widthAnchor.constraint(equalToConstant: 100),
            male.heightAnchor.constraint(equalToConstant: 20),
            
            female.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            female.topAnchor.constraint(equalTo: male.bottomAnchor, constant: 16),
            female.widthAnchor.constraint(equalToConstant: 100),
            female.heightAnchor.constraint(equalToConstant: 20),
            
            birthLabel.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            birthLabel.topAnchor.constraint(equalTo: female.bottomAnchor,constant: 34),
            
            birthTextField.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            birthTextField.topAnchor.constraint(equalTo: birthLabel.bottomAnchor, constant: 6),
            birthTextField.trailingAnchor.constraint(equalTo: rightButton.trailingAnchor),
            birthTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cityLabel.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            cityLabel.topAnchor.constraint(equalTo: birthTextField.bottomAnchor,constant: 14),
            
            cityTextField.leadingAnchor.constraint(equalTo: leftButton.leadingAnchor),
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 6),
            cityTextField.trailingAnchor.constraint(equalTo: rightButton.trailingAnchor),
            cityTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
