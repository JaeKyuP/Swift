//
//  ViewController.swift
//  week2
//
//  Created by jaegu park on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var profileButton: UIButton!
    @IBOutlet var todayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func profileButtonDidtap(_ sender: Any) {
//        guard let presentedViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresentedViewController") as? PresentedViewController else { return }
        
//        present(presentedViewController, animated: true)
        
        guard let pushedViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PushedViewController") as? PushedViewController else { return }
                
        navigationController?.pushViewController(pushedViewController, animated: true)
    }
    
}

