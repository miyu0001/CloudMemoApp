//
//  MainViewController.swift
//  CloudMemoApp
//
//  Created by 佐藤未悠 on 2021/07/18.
//

import UIKit
import NCMB

class MainViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    //NCMBObject型のメモの配列を用意する
    var memoArray = [NCMBObject]()

    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.dataSource = self
        listTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    //セルに表示させる個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    //Cellに表示させる内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "Cell")!
        //memoArrayのindexpath.row番目にアクセスして、memoの列を取り出す。Any型からString型に変更
        cell.textLabel?.text = memoArray[indexPath.row].object(forKey: "memo") as? String
        return cell
    }
    
    //セルが押された時の処理(どのセルが押されたか判別する関数）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //詳細画面に遷移
        performSegue(withIdentifier: "toDetail", sender: nil)
        //セルを押した後にグレーになるのを解除
        listTableView.deselectRow(at: indexPath, animated: true)
    }
    
    //詳細画面に値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            //次の画面の取得(DetailViewControllerx)
            let detailViewController = segue.destination as! DetailViewController
            //セルの中で何が選ばれているのか
            let selecrtedIndex = listTableView.indexPathForSelectedRow!
            detailViewController.selectedMemo = memoArray[selecrtedIndex.row]
        }
    }
    
    //データの読み込み
    func loadMemo(){
        let query = NCMBQuery(className: "Memo")
        //全部を持ってくる
        query?.findObjectsInBackground { (result, error) in
            if error != nil {
                //エラーがあったら
                print(error)
            } else {
                //データ取得成功
                self.memoArray = result as! [NCMBObject]
                //値が入ってる時点でtableViewをリロードする
                self.listTableView.reloadData()
            }
        }
    }
}
