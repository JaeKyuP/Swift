//
//  AddViewController.swift
//  reminder
//
//  Created by jaegu park on 2022/11/11.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var todolistTitle: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    // MARK: - Navigation
     
    public var completion: ((String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todolistTitle.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(todolistSave))
    }
    
    @objc func todolistSave() {
        if let todolistText = todolistTitle.text, !todolistText.isEmpty{
            let todolistDate = datePicker.date
            
            completion?(todolistText, todolistDate)
        }
    }
    
    func todolistCancel(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
