//
//  ViewController.swift
//  threadTimer
//
//  Created by jaegu park on 2022/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
    RunLoop.current.add(timer, forMode: .commonModes)

    
    
    @objc func fireTimer() {
        print("Timer fired!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

