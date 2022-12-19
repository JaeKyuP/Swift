//
//  SecondViewController.swift
//  week3
//
//  Created by jaegu park on 2022/10/03.
//

import UIKit

class SecondViewController: UIViewController {
    
    var resultString = ""
    
    @IBOutlet var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultString

        // Do any additional setup after loading the view.
    }
}
