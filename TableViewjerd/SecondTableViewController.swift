//
//  TBVC.swift
//  TableViewjerd
//
//  Created by yuki yamamoto on H29/01/28.
//  Copyright © 平成29年 yuki yamamoto. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController: UITableViewController {
    
    
    @IBAction func toSetting(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: self)

    }
    
    
    
    
    
    var names = [String]()
    var identities = [String]()
    var imgArray = [String]()
    
    override func viewDidLoad() {
        
        names = ["name1","name2","name3","name4"]
        identities = ["A","B","C","D"]
        imgArray = ["Oval1","Oval2","Oval3","Oval4"]
        
        //UITableViewの空セルのseparatorを消す
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    //Table Viewのセクション数を指定。(戻り値)-> (戻り値の型は数字だからInt)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
        //Table Viewのセルの中身をどのように表示するのか。(戻り値)-> (戻り値の型) returnで値cellの中身を返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルの再利用（cellに名前をつける）
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //UIImageView インスタンスの生成 + imgArrayをセルに記述
        let imageView = cell?.viewWithTag(1) as! UIImageView
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        
        //画像を表示するためのimageView
        imageView.image = img
        
        //UILabelインスタンスの生成 + namesをセルに記述
        let label1 = cell?.viewWithTag(2) as! UILabel
        label1.text = "\(names[indexPath.row])"
        
        
        
        //select時のcolorを緑にする
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.init(red: (138.0/255.0), green: (176.0/255.0), blue: (57.0/255.0), alpha: 1.0)
        cell?.selectedBackgroundView =  selectedView

        
        //関数では戻り値を返すreturnが実行されると、returnした時点で関数内の処理を終了します。
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = identities[indexPath.row]
        let ViewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(ViewController!, animated: true)
    }
    
    
    
}













