//
//  detailViewController.swift
//  Todolist
//
//  Created by jaegu park on 2022/10/05.
//

import UIKit

class detailViewController: UIViewController {
    
    @IBAction func deleteMemo(_ sender: Any) {
        let alert = UIAlertController(title: "삭제 확인", message: "메모를 삭제할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "삭제", style: .destructive) {
            [weak self] (action) in
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        let cancerAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancerAction)
        
        present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var memoTableView: UITableView!
    
    var memo: Memo?
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? cocoaViewController{
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        token = NotificationCenter.default.addObserver(forName: cocoaViewController.MemoDidChange, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in self?.memoTableView.reloadData()
        })
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

extension detailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
            return cell
        default:
            fatalError()
        }
    }
}
