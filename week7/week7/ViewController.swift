//
//  ViewController.swift
//  week7
//
//  Created by jaegu park on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var autologin: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if self.autologin.isOn {
            UserDefaults.standard.set(name, forKey: "save_username")
            UserDefaults.standard.set(password, forKey: "save_password")
            
            UserDefaults.standard.synchronize()
        } else {
            UserDefaults.standard.set("nil", forKey: "save_username")
            UserDefaults.standard.set("nil", forKey: "save_password")
            
            UserDefaults.standard.synchronize()
        }
        
        print("\(UserDefaults.standard.value(forKey: "save_username")!)")
        print("\(UserDefaults.standard.value(forKey: "save_username")!)")
    }
    
    @IBAction func signup(_ sender: UIButton) {
        guard let signupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        
        navigationController?.pushViewController(signupViewController, animated: true)
        
    }
    
}
