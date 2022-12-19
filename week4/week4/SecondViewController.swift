//
//  SecondViewController.swift
//  week4
//
//  Created by jaegu park on 2022/10/11.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var delegate: labelChangeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        guard let text = textField.text else { return }
        
        delegate?.onChange(text: text)
        dismiss(animated: true)
    }
}
