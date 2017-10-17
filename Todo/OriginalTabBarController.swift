//
//  Colortest.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/02/03.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit

class OriginalTabBarController: UITabBarController {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

   override func viewWillAppear(_ animated: Bool) {
     //   super.viewDidLoad()
    //super.viewDidLoad()
    
    // 選択時の設定
    let selectedColor:UIColor = UIColor(red: 20/255, green: 2/255, blue: 56/255, alpha: 1.0)
    let selectedAttributes = [NSForegroundColorAttributeName: UIColor(red: 20/255, green: 2/255, blue: 56/255, alpha: 1.0)]
   
    /// アイコンカラーの設定
    UITabBar.appearance().tintColor = UIColor(red: 20/255, green: 2/255, blue: 56/255, alpha: 1.0)
    
    /// タイトルテキストカラーの設定
    //UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: UIControlState.selected)
    
    UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: UIControlState.selected)
    
//   // 非選択時の設定
    let nomalAttributes = [NSForegroundColorAttributeName: UIColor.white]
//    /// タイトルテキストカラーの設定
    UITabBarItem.appearance().setTitleTextAttributes(nomalAttributes, for: UIControlState.normal)
//    /// アイコンカラー（画像）の設定
//    var assets :Array<String> = ["TabBarListImage.jpg", "TabBarSearchImage.jpg", "TabBarAccountImage.jpg"]
//    for (idx, item) in self.tabBar.items!.enumerate() {
//        item.image = UIImage(named: assets[idx])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
//    }
    // Do any additional setup after loading the view.
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
