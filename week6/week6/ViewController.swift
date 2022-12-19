//
//  ViewController.swift
//  week6
//
//  Created by jaegu park on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var timerButton: UIButton!
    
    var repeatTimer : Timer?
    var singleTimer : Timer {
        
        var flag: Bool = false
        
        let temp = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [weak self] (Timer) in
            self?.firstView.backgroundColor = self?.colorList.randomElement()
            
            if flag {
                UIView.animate(withDuration: 1) {
                    self?.timerButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    self?.timerButton.setTitleColor(.magenta, for: .normal)
                }
                flag = false
            }
            else {
                UIView.animate(withDuration: 1) {
                    self?.timerButton.transform = .identity
                    self?.timerButton.setTitleColor(.link, for: .normal)
                }
                flag = true
            }
        })
        return temp
    }
    
    var userInfoTimer : Timer? {
        let info : [String : String] = ["Umc" : "Buzz"]
        let temp = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(userInfofunc), userInfo: info, repeats: false)
        
        return temp
    }
    
    @objc func userInfofunc(timer : Timer){
        guard let userinfo = timer.userInfo else {
            print("Nil userInfo")
            return }
            
        print(userinfo)
    }
    
    var colorList: [UIColor] = [
        .blue,
        .brown,
        .cyan,
        .green]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callRepeatTimer()
    }

    func callRepeatTimer() {
        var cnt = 0
        
        let calendar = Calendar.current
        
        repeatTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {
            [weak self] (Timer) in
            
            let date = Date()
            let second = calendar.component(.second, from: date)
                
            cnt += 1
            print("Hello World \(second)")
            
            if cnt >= 5{
                //time를 멈추는 방법
                self?.repeatTimer?.invalidate()
                print("Stop Timer")
            }
        
        }
        //이벤트 처리시 timer가 발생하지 않는 원인 해결 방법
        RunLoop.current.add(repeatTimer!, forMode: .common)
        
        //정확한 용도를 잘 모르겠다,,,, + 베터리 소모를 줄여주고 그 시간 만큼 딜레이가 생긴다는데,,,
        repeatTimer?.tolerance = 5
    }
    
    @IBAction func letFire(_ sender: UIButton) {
        singleTimer.fire()
        userInfoTimer?.fire()
    }
}
