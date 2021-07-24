//
//  DetailViewController.swift
//  CloudMemoApp
//
//  Created by 佐藤未悠 on 2021/07/18.
//

import UIKit
import NCMB

class DetailViewController: UIViewController {

    //値が渡された時の受け皿
    var selectedMemo :NCMBObject!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //他のところをタッチしたキーボードが下がる
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)

        memoTextView.text = selectedMemo.object(forKey: "memo") as! String
    }
    
    @IBAction func update(_ sender: Any) {
        selectedMemo.setObject(memoTextView.text, forKey: "memo")
        selectedMemo.saveInBackground { error in
            if error != nil {
                //エラーがあったら
                print(error)
            } else {
                //保存成功したら一つ前の画面に戻る
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
 
    @IBAction func deleteMemo(_ sender: Any) {
        selectedMemo.deleteInBackground { error in
            if error != nil {
                //エラーがあったら
                print(error)
            } else {
                //削除成功
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    //キーボード下げる関数
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}
