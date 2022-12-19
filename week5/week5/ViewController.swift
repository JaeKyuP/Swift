//
//  ViewController.swift
//  week5
//
//  Created by jaegu park on 2022/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var paramEmail:UITextField!
    var paramUpdate:UISwitch!
    var paramInterval:UIStepper!
    var txtUpdate:UILabel!
    var txtInterval:UILabel!
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        activityIndicator.color = UIColor.red
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        
        activityIndicator.stopAnimating()
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.activityIndicator)
        // Do any additional setup after loading the view.
                
        //버튼 가운데 정렬
        let btnCenter = UIButton(type:.system)
        btnCenter.frame = CGRect(x: 50, y: 400, width: 150, height: 30)
        btnCenter.center = CGPoint(x: self.view.frame.size.width / 2, y: 400)
        btnCenter.setTitle("test", for: .normal)
        btnCenter.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
        self.view.addSubview(btnCenter)
                
        //MARK:- 네비게이션 뷰 설정
        //네비게이션 바 타이틀 설정
        self.navigationItem.title = "설정"
                
        //MARK:- 이메일 레이블 객체 생성
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
                
        //레이블 폰트 설정
        lblEmail.font = UIFont.systemFont(ofSize: 14)
                
        //루트뷰에 레이블 추가
        self.view.addSubview(lblEmail)
                
        //MARK:- 갱신 라벨 객체 생성
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        //MARK:-  갱신 주기라벨 객체 생성
        let lblIntervalUpdate = UILabel()
        lblIntervalUpdate.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblIntervalUpdate.text = "갱신주기"
        lblIntervalUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblIntervalUpdate)
                
        //MARK:- 텍스트 필드 추가
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.paramEmail.adjustsFontSizeToFitWidth = true
        self.paramEmail.placeholder = "이메일..."
        self.paramEmail.textAlignment = NSTextAlignment.right
        self.paramEmail.autocapitalizationType = .none
        self.view.addSubview(self.paramEmail)
                
        //MARK:-  스위치 객체 추가
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
                
        //스위치 On을 기본값으로 설정
        self.paramUpdate.setOn(true, animated: true)
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
                
        self.view.addSubview(self.paramUpdate)
                
        //MARK:- 스테퍼 객체 추가
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        self.view.addSubview(self.paramInterval)
                
        //MARK:- 스위치 값 표현 레이블 추가
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함"
        self.view.addSubview(self.txtUpdate)
                
        //MARK:- 스테퍼값 표현레이블
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = .red
        self.txtInterval.text = "0분마다"
                
        self.view.addSubview(self.txtInterval)
                
        //MARK:- 전송 버튼 추가
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
                
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    
    @objc func btnOnClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다.", for: .normal)
        }
    }
    
    @objc func presentUpdateValue(_ sender:UISwitch){
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지않음")
    }
    
    
    //MARK:- 스테퍼에 연결할 메서드
    @objc func presentIntervalValue(_ sender: UIStepper){
        self.txtInterval.text = "\(Int(sender.value))분마다"
    }

    
    //MARK:- 전송버튼 이벤트
    @objc func submit(_ sender : Any){
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }


}

