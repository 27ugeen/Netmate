//
//  RegisterConfirmViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class RegisterConfirmViewController: UIViewController {
    //MARK: - props
    
    //MARK: - subviews
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setSBFont(18)
        label.textColor = Palette.accentTextColor
        label.text = "Confirmation of registration"
        return label
    }()
    
    private lazy var midLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setNormFont(14)
        label.textColor = Palette.mainTextColor
        label.text = "We sent an SMS whit a code to the number:"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setSBFont(14)
        label.textColor = Palette.mainTextColor
        label.text = "+38 098 888 88 88"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var midSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setNormFont(12)
        label.textColor = Palette.secondTextColor
        label.text = "Enter code from SMS"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var phoneTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.appTintColor
        text.layer.borderColor = Palette.textFieldBorderColor.cgColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(16)
        text.tintColor = Palette.mainTextColor
        text.autocapitalizationType = .none
        text.placeholder = "________"
        text.textAlignment = .center
        text.becomeFirstResponder()
        return text
    }()
    
    private lazy var registerButton = MagicButton(title: "REGISTER", titleColor: Palette.btnWithBordTitleColor) {
        //        self.goToProfile()
    }
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "main_icon")
        return imageView
    }()
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK: - methods
    private func setupButton() {
        registerButton.setBackgroundColor(Palette.btnWithBordColor, forState: .normal)
        registerButton.titleLabel?.font = UIFont.setMedFont(16)
        registerButton.layer.cornerRadius = 8
        registerButton.clipsToBounds = true
    }
}
//MARK: - setupViews
extension RegisterConfirmViewController {
    private func setupViews() {
        
        self.navigationController?.isNavigationBarHidden = false
        //TODO: - set changing color for darkMode
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "gtlArrow")?.withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "gtlArrow")

        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topLabel)
        contentView.addSubview(midLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(midSubLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(registerButton)
        contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            topLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 104),
            
            midLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            midLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 12),
            
            phoneLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            phoneLabel.topAnchor.constraint(equalTo: midLabel.bottomAnchor, constant: 4),
            
            phoneTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: midLabel.bottomAnchor, constant: 138),
            phoneTextField.heightAnchor.constraint(equalToConstant: 48),
            phoneTextField.widthAnchor.constraint(equalToConstant: 260),
            
            midSubLabel.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
            midSubLabel.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: -5),
            
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 86),
            registerButton.heightAnchor.constraint(equalToConstant: 48),
            registerButton.widthAnchor.constraint(equalToConstant: 260),
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 43),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 86)
        ])
    }
}
//MARK: - setupKeyboard
private extension RegisterConfirmViewController {
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}
