//
//  AddMemoViewController.swift
//  CloudMemoApp
//
//  Created by 佐藤未悠 on 2021/07/18.
//

import UIKit
import NCMB

class AddMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //他のところをタッチしたキーボードが下がる
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)

    }

    @IBAction func save(_ sender: Any) {
        let object = NCMBObject(className: "Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ error in
            if error != nil {
                //保存失敗
                print(error)
            } else {
                //保存成功したらアラート表示
                let alertController = UIAlertController(title: "保存完了", message: "メモの保存が完了しました。", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { action in
                    //画面一個前に戻る
                    self.navigationController?.popViewController(animated: true)
                }
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
    //キーボード下げる関数
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
