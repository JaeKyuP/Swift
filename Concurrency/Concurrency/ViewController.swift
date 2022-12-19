//
//  ViewController.swift
//  Concurrency
//
//  Created by jaegu park on 2022/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func start(_ sender: Any) {
        countLabel.text = "0"
        
        logThread(with: "Start")
        
        DispatchQueue.global().async {
            for count in 0...100 {
                self.logThread(with: "for #\(count)")
                DispatchQueue.main.async {
                    self.logThread(with: "update label")
                    self.countLabel.text = "\(count)"
                }
                Thread.sleep(forTimeInterval: 1)
            }
            self.logThread(with: "Done")
        }
        self.logThread(with: "End")
    }
    
    func logThread(with task: String) {
        if Thread.isMainThread {
            print("Main Thread: \(task)")
        } else {
            print("Background Thread: \(task)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

