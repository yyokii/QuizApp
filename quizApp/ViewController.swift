//
//  ViewController.swift
//  quizApp
//
//  Created by 東原与生 on 2017/04/23.
//  Copyright © 2017年 yoki. All rights reserved.
//

import UIKit

//テーブルビューに関係する定数  ??ここでやんなくてもよくね
struct GuidanceTableStruct {
    static let cellCount: Int = 5
    static let cellSectionCount: Int = 1
}

class ViewController: UIViewController,UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //Outlet接続をした部品
    @IBOutlet var guideTableView: UITableView!
    //テーブルビューに表示する文言の内容を入れておくメンバ変数
    var guidanceArray: NSMutableArray = []
    
    //画面出現のタイミングに読み込まれる処理
    override func viewWillAppear(_ animated: Bool) {
        
        //ガイダンス用のテーブルビューに表示するテキストを(CSV形式で準備)読み込む
        let csvBundle = Bundle.main.path(forResource: "guidance", ofType: "csv")
        
        //CSVデータの解析処理
        do {
            //CSVデータを読み込む、改行があるので\rが含まれている
            var csvData: String = try String(contentsOfFile: csvBundle!, encoding: String.Encoding.utf8)
            
            csvData = csvData.replacingOccurrences(of: "\r", with: "")
            
            //改行を基準にしてデータを分割する読み込む
            let csvArray = csvData.components(separatedBy: "\n")
            //print(csvArray)
            //CSVデータの行数分ループさせる
            for line in csvArray {
                
                //カンマ区切りの1行を["aaa", "bbb", ... , "zzz"]形式に変換して代入する
                let parts = line.components(separatedBy: ",")
                self.guidanceArray.add(parts)
            }
            //print(self.guidanceArray)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ナビゲーションのデリゲート設定
        self.navigationController?.delegate = self
        self.navigationItem.title = "食べ合わせクイズ"
        
        //テーブルビューのデリゲート設定
        self.guideTableView.delegate = self
        self.guideTableView.dataSource = self
        
        //自動計算の場合は必要
        //self.guideTableView.estimatedRowHeight = 100
        //self.guideTableView.rowHeight = UITableViewAutomaticDimension
        
        //Xibのクラスを読み込む、nibname はファイル名を入力
        let nibDefault:UINib = UINib(nibName: "guidanceCell", bundle: nil)
        self.guideTableView.register(nibDefault, forCellReuseIdentifier: "guidanceCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return GuidanceTableStruct.cellSectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GuidanceTableStruct.cellCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Xibファイルを元にデータを作成する
        let cell = tableView.dequeueReusableCell(withIdentifier: "guidanceCell") as? guidanceCell
        
        //取得したデータを読み込ませる
        //配列 → 0番目：タイトル, 1番目：説明文,
        let guidanceData: NSArray = self.guidanceArray[indexPath.row] as! NSArray
        
        cell!.guidanceTitle.text = guidanceData[0] as? String
        cell!.guidanceDescription.text = guidanceData[1] as? String
        
        //セルのアクセサリタイプと背景の設定
        cell!.accessoryType = UITableViewCellAccessoryType.none
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell!
    }
    
    //データをリロードした際に読み込まれるメソッド、使ってる？？
    func reloadData() {
        self.guideTableView.reloadData()
    }
    
    //クイズ画面に遷移するアクション
    @IBAction func goQuizAction(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "goQuiz", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

