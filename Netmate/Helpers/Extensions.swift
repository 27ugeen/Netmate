//
//  Utils.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import Foundation
import UIKit


extension UIViewController {
    func showAlertOk(message: String) {
        let alertTitle = "Error"
        let alertOk = "Ok"
        let alertVC = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: alertOk, style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension UITabBar {
    static func setTransparentTabbar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
            color.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        }
        setBackgroundImage(colorImage, for: controlState)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}

extension UIFont {
    static func setNormFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Regular", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func setMedFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Medium", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func setSBFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-SemiBold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
}
