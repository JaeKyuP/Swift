//
//  ViewController.swift
//  week8
//
//  Created by jaegu park on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var orangeViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var orangeViewHeightContraint: NSLayoutConstraint!
    @IBOutlet var orangeViewTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var orageViewSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var orageViewLongPressGestureRecognizer: UILongPressGestureRecognizer!
    var flag = false
    var flag_1 = false
    var flag_2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeViewTapGestureRecognizer.addTarget(self, action: #selector(orangeViewDidTap))
        orageViewSwipeGestureRecognizer.addTarget(self, action: #selector(orangeViewDidSwipe))
        orageViewLongPressGestureRecognizer.addTarget(self, action: #selector(orangeViewDidLongPress))
    }
    
    @objc func orangeViewDidTap() {
        if !flag {
            UIView.animate(
                withDuration: 3,
                animations: {
                    self.orangeViewTopConstraint.constant = 50
                    self.orangeViewHeightContraint.constant = 500
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.flag = true
                }
            )
        } else {
            UIView.animate(
                withDuration: 3,
                animations: {
                    self.orangeViewTopConstraint.constant = 199
                    self.orangeViewHeightContraint.constant = 128
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.flag = false
                }
            )
        }
    }
    
    @objc func orangeViewDidSwipe() {
        if !flag_1 {
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.orangeView.backgroundColor = UIColor.blue
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.flag_1 = true
                }
            )
        } else {
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.orangeView.backgroundColor = UIColor.orange
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.flag_1 = false
                }
            )
        }
    }
   
    @objc func orangeViewDidLongPress() {
        if !flag_2 {
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.orangeView.alpha = 0
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.flag_2 = true
                }
            )
        } else {
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.orangeView.alpha = 1
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.flag_2 = true
                }
            )
        }
    }
}
