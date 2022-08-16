//
//  FavoriteSearchViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class FavoriteSearchViewController: UIViewController {
    //MARK: - props
    var filterAction: ((_ author: String) -> Void)?
    
    //MARK: - localization
    private let searchField = "search_field".localized()
    private let cancelBtn = "cancel_btn".localized()
    private let searchBtn = "search_btn".localized()
    private let searchAuthorAlert = "search_author_alert".localized()
    
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
    
    private lazy var searchTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = Palette.appTintColor
        text.layer.borderColor = Palette.textFieldBorderColor.cgColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 8
        text.font = UIFont.setNormFont(16)
        text.tintColor = Palette.accentTextColor
        text.autocapitalizationType = .none
        text.placeholder = searchField
        text.textAlignment = .left
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.becomeFirstResponder()
        return text
    }()
    
    private lazy var cancelButton = MagicButton(title: cancelBtn, titleColor: Palette.accentTextColor) {
        self.dismiss(animated: true)
    }
    
    private lazy var searchButton = MagicButton(title: searchBtn, titleColor: Palette.btnWithBordTitleColor) {
        guard self.searchTextField.text != "" else {
            self.showAlertOk(message: self.searchAuthorAlert)
            return
        }
        self.filterAction?(self.searchTextField.text ?? "")
        self.dismiss(animated: true)
    }
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        setupButtons()
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
}
// MARK: - setupButtons
extension FavoriteSearchViewController {
    private func setupButtons() {
        cancelButton.titleLabel?.font = UIFont.setMedFont(16)
        cancelButton.layer.cornerRadius = 8
        cancelButton.clipsToBounds = true
        cancelButton.setTitleColor(.systemRed, for: .highlighted)
        
        searchButton.setBackgroundColor(Palette.btnWithBordColor, forState: .normal)
        searchButton.titleLabel?.font = UIFont.setMedFont(16)
        searchButton.layer.cornerRadius = 8
        searchButton.clipsToBounds = true
    }
}
// MARK: - setup views
extension FavoriteSearchViewController {
    private func setupViews() {
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(searchTextField)
        contentView.addSubview(cancelButton)
        contentView.addSubview(searchButton)
        
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
            
            searchTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            searchTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 42),
            searchTextField.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            cancelButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 42),
            cancelButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16),
            searchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            searchButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
// MARK: - setupKeyboard
private extension FavoriteSearchViewController {
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
