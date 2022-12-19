//
//  cocoaViewController.swift
//  Todolist
//
//  Created by jaegu park on 2022/10/04.
//

import UIKit

class cocoaViewController: UIViewController {
    
    var editTarget: Memo?
    var originalMemoContent: String?

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "Please enter a note.")
            return
        }
        if let target = editTarget {
            target.content = memo
            NotificationCenter.default.post(name: cocoaViewController.MemoDidChange, object: nil)
        } else {
            let newMemo = Memo(content: memo)
            Memo.dummyMemoList.append(newMemo)
            NotificationCenter.default.post(name: cocoaViewController.newMemoDisInsert, object: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memo = editTarget {
            navigationItem.title = "Memo Editing"
            memoTextView.text = memo.content
            originalMemoContent = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        memoTextView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.presentationController?.delegate = nil
    }
}

extension cocoaViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let original = originalMemoContent, let edited = textView.text {
            isModalInPresentation = original != edited
        }
    }
}

extension cocoaViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "NOTICE", message: "Would you like to save your edits?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [weak self] (action) in self?.save(action)
        }
        alert.addAction(okAction)
        let cancerAction = UIAlertAction(title: "Cancel", style: .cancel) {
            [weak self] (action) in self?.close(action)
        }
        alert.addAction(cancerAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension cocoaViewController {
    static let newMemoDisInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let MemoDidChange = Notification.Name(rawValue: "MemoDidChange")
}
