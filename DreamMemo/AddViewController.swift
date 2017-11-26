//
//  AddViewController.swift
//  DreamMemo
//
//  Created by 田邊範子 on 2017/11/12.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")!
        cell.textLabel?.text = contentsArray[indexPath.row]
        return cell
    }
    
    
    var contentsArray = ["0", "1", "2", "3", "4", "5"]
//    var contentsArray = [String]()
    let nowDate = Date()
    let dateFormat = DateFormatter()
    let inputDatePicker = UIDatePicker()
    
    @IBOutlet var dateField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        日付フィールドの設定
        dateFormat.dateFormat = "MM月dd日hh時mm分"
        dateField.text = dateFormat.string(from: nowDate)
        self.dateField.delegate = self
        
        // DatePickerの設定(日付用)
        inputDatePicker.datePickerMode = UIDatePickerMode.date
        dateField.inputView = inputDatePicker
        
        // キーボードに表示するツールバーの表示
        let pickerToolBar = UIToolbar()
//        (frame: CGRect(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        pickerToolBar.barStyle = .blackTranslucent
        pickerToolBar.tintColor = UIColor.white
        pickerToolBar.backgroundColor = UIColor.black
        
        //ボタンの設定
        //右寄せのためのスペース設定
        let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,target: self,action: Selector(""))
        
        //完了ボタンを設定
        let toolBarBtn      = UIBarButtonItem(title: "完了", style: .done, target: self, action: Selector("toolBarBtnPush:"))
        
        //ツールバーにボタンを表示
        pickerToolBar.items = [spaceBarBtn,toolBarBtn]
        dateField.inputAccessoryView = pickerToolBar
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //完了を押すとピッカーの値を、テキストフィールドに挿入して、ピッカーを閉じる
    func toolBarBtnPush(sender: UIBarButtonItem){
        
        let pickerDate = inputDatePicker.date
        dateField.text = dateFormat.string(from: pickerDate)
        
        self.view.endEditing(true)
    
    
   
        
    }
    
    @IBAction func save(){
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(["楽しいこと","aaaa"], forKey: "content")
        contentsArray = userDefaults.object(forKey: "content") as! [String]
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
