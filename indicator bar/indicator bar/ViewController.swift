//
//  ViewController.swift
//  indicator bar
//
//  Created by jaegu park on 2022/10/31.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let animationView: LottieAnimationView = .init(name: "icecream")
        self.view.addSubview(animationView)
        
        animationView.frame = self.view.bounds
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        
        animationView.play()
        
        animationView.loopMode = .loop
    }


}

