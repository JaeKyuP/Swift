//
//  ReadViewController.swift
//  week5
//
//  Created by jaegu park on 2022/10/31.
//

import UIKit

class ReadViewController: UIViewController {
    
    var pEmail:String?
    var pUpdate:Bool?
    var pInterval:Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        //MARK:- 레이블 객체 초기화
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
        

        //MARK:- 레이블 위치 지정
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        update.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        //MARK:- 전달받은 값 레이블에 표시
        email.text = "전달받은 이메일 : \(self.pEmail!)"
        update.text = "업데이트 여부 : \(self.pUpdate!)"
        interval.text = "업데이트 주기 : \(self.pInterval!)"
        
        
        //MARK:- 레이블 추가
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
