//
//  AddToDo.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/01/10.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit
var todoItem = [String]()
var DateItem = [String]()

class AddToDo: UIViewController {
    
    //Label出した
    @IBOutlet weak var testLabel: UILabel!
    
    //キーボード打つ
    @IBOutlet weak var itemText: UITextField!
    
    
    var datetext: String = ""
    
    
    //Datepicker出したの
    @IBAction func changeDate(sender: AnyObject) {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        //testLabelに表示
        testLabel.text = formatter.stringFromDate(sender.date)
        datetext = formatter.stringFromDate(sender.date)
        
        NSLog("%@がでてます datetext",datetext)
    
    }
    
    //NSUserDefaulutsに名前だけ登録
    
    @IBAction func addItem(sender: AnyObject){
        
        if itemText.text == "" {
            
    //アラート
    let alertController = UIAlertController(title: "空欄です", message: "やるべきことを入力してください", preferredStyle: .Alert)
            
    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertController.addAction(defaultAction)
            
    presentViewController(alertController, animated: true, completion: nil)
            

            
        } else {

        todoItem.append(itemText.text!)
        //itemText.text = ""
        NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
            
        //Date登録
        DateItem.append(datetext)
//        DateItem.append(testLabel.text!)
        NSLog("%@がでてます DateItem",DateItem)

        itemText.text = ""
        NSUserDefaults.standardUserDefaults().setObject(DateItem, forKey: "Date")
        
        //アラート
        let alertController = UIAlertController(title: "目標設定", message: "締め切りまでに終わらせてください", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
        
        }
    
    }
    
    
    //MARK: キーボードが出ている状態で、キーボード以外をタップしたらキーボードを閉じる
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //非表示にする。
        if(itemText.isFirstResponder()){
            itemText.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemText.resignFirstResponder()
        return true
    }
    
    
    // Do any additional setup after loading the view.
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
