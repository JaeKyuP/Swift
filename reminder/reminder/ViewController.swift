//
//  ViewController.swift
//  reminder
//
//  Created by jaegu park on 2022/11/10.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var todolist: UITableView!
    
    var models = [Alert]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todolist.delegate = self
        todolist.dataSource = self
    }
    
    @IBAction func todolistAdd(_ sender: Any) {
        guard let viewcon = storyboard?.instantiateViewController(withIdentifier: "add") as? AddViewController else { return }
        
        viewcon.title = "새로운 할일 생성"
        viewcon.navigationItem.largeTitleDisplayMode = .never
        viewcon.completion = {title, date in
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let todo = Alert(title: title, date: date, identifier: "id_\(title)")
                self.models.append(todo)
                self.todolist.reloadData()
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                
                let todo_Date = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: todo_Date), repeats: false)
            }
    }
        
    @IBAction func todolistAlert(_ sender: Any) {
    }
}

struct Alert {
    let title: String
    let date: Date
    let identifier: String
}

