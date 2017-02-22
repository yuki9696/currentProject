//
//  NextTBVC.swift
//  TableViewjerd
//
//  Created by yuki yamamoto on H29/01/29.
//  Copyright © 平成29年 yuki yamamoto. All rights reserved.
//

import Foundation
import UIKit

class ThirdTableViewController: UITableViewController {
    
    var names2 = [String]()
    var identities2 = [String]()
    var imgArray2 = [String]()

    override func viewDidLoad() {
        
        names2 = ["ちっす","もう三日","大丈夫！","びしばし"]
        identities2 = ["A2","B2","C2","D2"]
        imgArray2 = ["Oval1","Oval2","Oval3","Oval4"]
        
        //UITableViewの空セルのseparatorを消す
        tableView.tableFooterView = UIView(frame: .zero)
    }

    
    //Table Viewのセクション数を指定。(戻り値)-> (戻り値の型)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names2.count
    }
        
      //Table Viewセルの中身をどのように表示するのか。(戻り値)-> (戻り値の型)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルの再利用（cellに名前をつける,cell2はインスタンス名）
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2")
        
        //UIImageView インスタンスの生成 + imgArray2をセルに記述
        let imageView = cell2?.viewWithTag(1) as! UIImageView
        let img = UIImage(named:"\(imgArray2[indexPath.row])")

        imageView.image = img
        
        //UILabelインスタンスの生成 + names2をセルに記述
        let label1 = cell2?.viewWithTag(2) as! UILabel
        label1.text = "\(names2[indexPath.row])"
        
        //select時のcolorを緑にする
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.init(red: (138.0/255.0), green: (176.0/255.0), blue: (57.0/255.0), alpha: 1.0)
        cell2?.selectedBackgroundView =  selectedView
        

        
        
        
        
        //関数では戻り値を返すreturnが実行されると、returnした時点で関数内の処理を終了します。
        return cell2!

    }
    
        //Cell押下時のアクション(_ 引数名:型, 外部引数名 引数名:型)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //identities2のIdentifierが記述されていいるセルに移動
        let vcName = identities2[indexPath.row]
        let ViewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(ViewController!, animated: true)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // セルの高さを設定
        return 64
    }
    

    
}


