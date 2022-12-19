//
//  ViewController.swift
//  RunLoop
//
//  Created by jaegu park on 2022/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    lazy var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "hh:mm:ss"
        return f
    }()
    
    func updateTimer(_ timer: Timer) {
        print(#function, Date(), timer)
        timeLabel.text = formatter.string(from: Date())
    }
    
    func resetTimer() {
        timeLabel.text = "00:00:00"
    }
    
    var timer: Timer?
    
    @objc func timeFired(_ timer: Timer) {
        updateTimer(timer)
    }
    
    @IBAction func start(_ sender: Any) {
        guard timer == nil else { return }
    //    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in guard timer.isValid else { return }
    //        self.updateTimer(timer)
    //    })
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timeFired(_:)), userInfo: nil, repeats: true)
        timer?.tolerance = 0.2
        RunLoop.current.add(timer!, forMode: .default)
        timer?.fire()
    }
    @IBAction func stop(_ sender: Any) {
        timer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetTimer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        start(timer)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
}
