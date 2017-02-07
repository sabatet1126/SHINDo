//
//  ViewController.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/01/10.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
//toDOリスト
    @IBOutlet weak var todolistTable: UITableView!
    
//NSUserDefalts出した
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            todoItem = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("Date") != nil {
            DateItem = NSUserDefaults.standardUserDefaults().objectForKey("Date") as! [String]
        }

    }
    
//元からある
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//tableViewの設定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
//表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.YOTEILabel.text = todoItem[indexPath.row]
        cell.HIZUKELabel.text = DateItem[indexPath.row]
        
        cell.YOTEILabel.textColor = UIColor.blackColor()
        cell.HIZUKELabel.textColor = UIColor.blackColor()
    

        if indexPath.row % 2 == 1 {
        cell.backgroundColor = UIColor(red: 146/255, green: 220/255, blue: 229/255, alpha: 1.0)
        cell.YOTEILabel.textColor = UIColor.whiteColor()
        cell.HIZUKELabel.textColor = UIColor.whiteColor()
        
            
    }
        return cell
    }
//消すんじゃない？
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todoItem.removeAtIndex(indexPath.row)
            DateItem.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
            NSUserDefaults.standardUserDefaults().setObject(DateItem, forKey: "Date")

            todolistTable.reloadData()
        }
   
        }
    
  
//リロード
    override func viewDidAppear(animated: Bool) {
        todolistTable.reloadData()
    }
}