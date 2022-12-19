//
//  UIViewController_Alert.swift
//  Todolist
//
//  Created by jaegu park on 2022/10/05.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String = "Notice", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
