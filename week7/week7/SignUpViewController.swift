//
//  SignUpViewController.swift
//  week7
//
//  Created by jaegu park on 2022/11/07.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupButton(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        UserDefaults.standard.set(password, forKey: name)
        
        print("이름: \(name), 비밀번호: \(password)")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
