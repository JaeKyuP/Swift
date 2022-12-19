//
//  ViewController.swift
//  week4
//
//  Created by jaegu park on 2022/10/11.
//

import UIKit

protocol labelChangeProtocol {
    func onChange(text: String)
}

class ViewController: UIViewController, labelChangeProtocol {
    func onChange(text: String) {
        label.text = text
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        guard let SecondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        SecondViewController.modalPresentationStyle = .fullScreen
        SecondViewController.delegate = self
        present(SecondViewController, animated: true)
    }
    
}

