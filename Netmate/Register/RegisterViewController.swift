//
//  RegisterViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - props
    private let appCoordinator: AppCoordinator
    
    //MARK: - localization
    private let titleReg = "reg_btn".localized()
    private let titleMid = "mid_reg_lab".localized()
    private let titleMidSub = "mid_reg_sub_lab".localized()
    private let titleNext = "next_btn".localized()
    private let titleBotSub = "bot_reg_sub_lab".localized()
    
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
        label.textColor = Palette.mainTextColor
        label.text = titleReg
        return label
    }()
    
    private lazy var midLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setMedFont(16)
        label.textColor = Palette.mainTextColor
        label.text = titleMid
        return label
    }()
    
    private lazy var midSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setMedFont(12)
        label.textColor = Palette.secondTextColor
        label.text = titleMidSub
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var phoneTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.appTintColor
        text.layer.borderColor = Palette.textFieldBorderColor.cgColor
        text.tintColor = Palette.accentTextColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(16)
        text.autocapitalizationType = .none
        text.placeholder = "+38___-___-__-__"
        text.textAlignment = .center
        text.becomeFirstResponder()
        return text
    }()
    
    private lazy var nextButton = MagicButton(title: titleNext, titleColor: Palette.btnWithBordTitleColor) {
        let regConfVC = RegisterConfirmViewController(coordinator: self.appCoordinator)
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(regConfVC, animated: true)
    }
    
    private lazy var botSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setMedFont(12)
        label.textColor = Palette.secondTextColor
        label.text = titleBotSub
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    //MARK: - init
    init(coordinator: AppCoordinator) {
        self.appCoordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
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
        nextButton.setBackgroundColor(Palette.btnWithBordColor, forState: .normal)
        nextButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        nextButton.titleLabel?.font = UIFont.setMedFont(16)
        nextButton.layer.cornerRadius = 8
        nextButton.clipsToBounds = true
    }
}
//MARK: - setupViews
extension RegisterViewController {
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
        contentView.addSubview(midSubLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(nextButton)
        contentView.addSubview(botSubLabel)
        
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
            midLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 70),
            
            midSubLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            midSubLabel.topAnchor.constraint(equalTo: midLabel.bottomAnchor, constant: 5),
            midSubLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            
            phoneTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: midSubLabel.bottomAnchor, constant: 16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 48),
            phoneTextField.widthAnchor.constraint(equalToConstant: 260),
            
            nextButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 70),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            
            botSubLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 58),
            botSubLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            botSubLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -58),
            botSubLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
//MARK: - setupKeyboard
private extension RegisterViewController {
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
