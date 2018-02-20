//
//  AddToDo.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/01/10.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit
import UserNotifications



var todoItem = [String]()
var DateItem = [String]()

class AddToDo: UIViewController ,UNUserNotificationCenterDelegate{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    var colorData : UserDefaults = UserDefaults.standard
    var number = -1
    
    @IBOutlet var add: UIButton!
    
    @IBOutlet weak var BACK: UIView!
    
    @IBOutlet weak var DATEBACK: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BACK.backgroundColor = UIColor.white
        print(number)
        
        if number >= 0{
            
            if UserDefaults.standard.object(forKey: "todoList") != nil {
                todoItem = UserDefaults.standard.object(forKey: "todoList") as! [String]
            }
            
            itemText.text = "\(todoItem[number])"
            //TodoItem
            //Datepicker
        }else{
            
            itemText.text = " "
        }
        
        
        //        todoItem.remove(at: AddToDo.number)
        //        DateItem.remove(at: AddToDo.number)
        //        UserDefaults.standard.set(todoItem, forKey: "todoList")
        //        UserDefaults.standard.set(DateItem, forKey: "Date")
        //        AddToDo.number = AddToDo.number

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        BACK.backgroundColor = appDelegate.aColor
        add.backgroundColor = appDelegate.eColor
        
        
        //2017/09/17 追記
        add.layer.cornerRadius = 0.1*(UIScreen.main.bounds.size.width)
        
    }
    
    //Label出した
    @IBOutlet weak var testLabel: UILabel!
    
    //キーボード打つ
    @IBOutlet weak var itemText: UITextField!
    
    
    
    
    var datetext: String = ""
    
    
    @IBOutlet var Datepicker: UIDatePicker!
    
    //Datepicker出したの
    @IBAction func changeDate(_ sender: AnyObject) {
        
        print(Datepicker.date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd/HH/mm"
        
        //testLabelに表示
        testLabel.text = formatter.string(from: sender.date)
        datetext = formatter.string(from: sender.date)
        
        testLabel.textColor = appDelegate.bColor
        
        NSLog("%@がでてます datetext",datetext)
        
        
    }
    
    //NSUserDefaulutsに名前だけ登録
    
    @IBAction func addItem(_ sender: AnyObject){
        
        
        
        guard itemText.text != "" else {
            //アラート
            let alertController = UIAlertController(title: "空欄です", message: "やるべきことを入力してください", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        
        
        todoItem.append(itemText.text!)
        //itemText.text = ""
        UserDefaults.standard.set(todoItem, forKey: "todoList")
        
        //Date登録
        DateItem.append(datetext)
        //        DateItem.append(testLabel.text!)
        NSLog("%@がでてます DateItem",DateItem)
        
        itemText.text = ""
        UserDefaults.standard.set(DateItem, forKey: "Date")
        
        for i in 0 ..< DateItem.count - 1 {
            for j in ((i + 1)...DateItem.count-1).reversed() {
                if (DateItem[j] < DateItem[j-1]){
                    let tmpD = DateItem[j]
                    DateItem[j] = DateItem[j-1]
                    DateItem[j-1] = tmpD
                    let tmpT = todoItem[j]
                    todoItem[j] = todoItem[j-1]
                    todoItem[j-1] = tmpT
                }
            }
        }
        UserDefaults.standard.set(todoItem, forKey: "todoList")
        UserDefaults.standard.set(DateItem, forKey: "Date")
        
        //通知
        
        if #available(iOS 10.0, *) {
            
            
            
                       print(datetext)
                       
            
        }
        
        //アラート
        if number >= 0{
            self.dismiss(animated: true)
            //ずっと数字が2
            print(number)
            todoItem.remove(at: number)
        }else{
            print(number)
        let alertController = UIAlertController(title: "目標設定", message: "締め切りまでに終わらせてください", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        }
        
        
    }
    
    
    
    //MARK: キーボードが出ている状態で、キーボード以外をタップしたらキーボードを閉じる
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //非表示にする。
        if(itemText.isFirstResponder){
            itemText.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        itemText.resignFirstResponder()
        return true
    }
    
    
    // Do any additional setup after loading the view.
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        
        // ...
        
        let identifier = notification.request.identifier
        switch identifier {
        case "alert":
            completionHandler([.alert]) //通知だけ
        case "both":
            completionHandler([.sound, .alert]) //サウンドと通知
        default:
            () // 何もしない
        }
    }
    
    
    
    //ViewController.swift
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
