//
//  twitter.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/08/05.
//  Copyright © 2017年 鯖. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterViewController: UIViewController {
    let saveData : UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        let store = Twitter.sharedInstance().sessionStore
        if let lastSession = store.session() {
            
           let alertController = UIAlertController(title: "登録済", message: "twitterは登録済みです。", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                self.navigationController?.popViewController(animated: true)
            })

            let cancelAction: UIAlertAction = UIAlertAction(title: "ログアウト", style: UIAlertActionStyle.cancel, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                let store = Twitter.sharedInstance().sessionStore
                
                if let userID = store.session()?.userID {
                    store.logOutUserID(userID)
                    self.saveData.removeObject(forKey: "NAME")
                }
                print("Cancel")
                self.navigationController?.popViewController(animated: true)

            })
            alertController.addAction(ok)
            alertController.addAction(cancelAction)
            
            
            present(alertController, animated: true, completion: nil)
            
            let client = TWTRAPIClient()
            client.loadUser(withID: lastSession.userID) { (user, error) -> Void in
                print(user)
                if let user = user {
                    self.saveData.set(user.name,forKey: "NAME")
                    self.saveData.synchronize()
                }
                
                if let error = error {
                    print(error)
                }
            }
        } else {
            let logInButton = TWTRLogInButton(logInCompletion: { session, error in
                if let session = session {
                    let client = TWTRAPIClient()
                    let id = session.userID
                    client.loadUser(withID: id) { (user, error) -> Void in
                        print(user)
                        var saveDate : UserDefaults = UserDefaults.standard
                        if let user = user {
                            saveDate.set(user.name,forKey: "NAME")
                            saveDate.synchronize()
                        }
                        
                        if let error = error {
                            print(error)
                        }
                    }
                } else {
                    print("error: \(error?.localizedDescription)");
                }
            })
            //      logInButton.layer.position = CGPoint(x: self.view.frame.width/2, y:100)
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
        }
        

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
