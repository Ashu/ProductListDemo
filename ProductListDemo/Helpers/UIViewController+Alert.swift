//
//  UIViewController+Alert.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import UIKit

extension UIViewController {
    func showAlert(headerText: String = "", text: String, buttonTitle: String) {
        let alert = UIAlertController(title: headerText, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
