//
//  SetteiViewController.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/04/03.
//  Copyright © 2017年 鯖. All rights reserved.
//
import UIKit
import Social
import TwitterKit

class SetteiViewCountroller: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var webButton: UIButton!
    @IBOutlet weak var charaButton: UIButton!
    @IBOutlet var tweetButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet weak var twitterLabel: UILabel!
    
    var charaNum:UserDefaults = UserDefaults.standard
    var serifuData : UserDefaults = UserDefaults.standard
    var colorData : UserDefaults = UserDefaults.standard

        @IBAction func backSetteiButton(_ segue: UIStoryboardSegue) {}
    
    var TWEETtext = ["ーーさんの進捗は私が監視させていただいています！...一緒に頑張るわよ。　appstoreURL","ーーの作業進捗、あたしが監視してるよ。さっさと仕上げよ。　appstoreURL","ーーさんは作業を頑張ってますよ...ね？そうよね？　appstoreURL","ーー、作業、頑張ってるから、応援したげてね...! appstoreURL","ーーちゃん、作業頑張ってまーす！いぇーい！　appstoreURL","ーーちゃんちゃんと作業進ませてるよ〜、ほんとだよ〜！...たぶん...? appstore","んもぅーーちゃん作業やってる？サボってたら容赦無く咎めなさいよ。やっちゃいなさい。　appstoreURL","ーーくんの作業は僕が監視しています。サボるようなら許しませんよ！　appstoreURL","ーーは絶賛作業中だ。みんなも監視よろしく頼んだぞ。　appstore","えええっと！ーーさんのし、進捗は僕が管理させていただきます！お、終わらせましょう！　appstore","ーーは作業頑張ってるみたいだけど...まあ、終わらせられるはずだよね〜？　appstore","...ーーさんは、作業中です。...みなさんも応援宜しくお願いします...。　appstoreURL","あー、ーーは作業中だから、みんなもサボってたら適度に急かしてやれよー。よろしくー。　appstore","みなさん！ーー様は作業を頑張っておられます！どうか応援のほどよろしくお願いいたします！ appstoreURL"]
    
    @IBAction func logout() {
        
    print("ろっぐあうつ")
        if let session = TWTRTwitter.sharedInstance().sessionStore.session() {
            TWTRTwitter.sharedInstance().sessionStore.logOutUserID(session.userID)
        }
        twitterButton.isHidden = true
        twitterButton.alpha = 0
    }
    @IBAction func twitterAction(){
        if !TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            print("ろぐいんなのにゃ")
            TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
                if (session != nil) {
                    print("signed in as \(session?.userName)");
                   UserDefaults.standard.set(session?.userName, forKey: "NAME")
                    //screenName
                    var users: [String] = []
                    users.append((session?.userName)!)
                    self.fetchUsers(withUserIDs: users)
                    self.twitterButton.alpha = 1
                    self.twitterButton.isHidden = false
                    
                    let client = TWTRAPIClient()
                    client.loadUser(withID: (session?.userID)!, completion: { (user, error) -> Void in
                        DispatchQueue.main.async() {
                            print("UseName: \(session?.userName)")
                            print("Name: \(String(describing: user?.profileURL))")
                            print("Image Url: \(user?.profileImageURL ?? "nil")")
                            print(user?.screenName)
                            
                    }
                    })
                } else {
                    print("error: \(error?.localizedDescription)");
                }
                })
    
        }else{
            print("つぶやくのにゃ")
           
            print("\(charaNum.object(forKey: "NAME"))ねぃむ")
            print("\(charaNum.object(forKey: "Num"))なむ")
            if let NAME = charaNum.object(forKey: "NAME") as? String, let _ = charaNum.object(forKey: "Num") {
                var text:String=""
            
                if charaNum.object(forKey: "Num") as! Int == 0 {
                    text = "\(NAME)さんの進捗は私が監視させていただいています！...一緒に頑張るわよ。　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 1{
                    text = "\(NAME)の作業進捗、あたしが監視してるよ。さっさと仕上げよ。【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 2{
                    text = "\(NAME)さんは作業を頑張ってますよ...ね？そうよね？　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 3{
                    text = "\(NAME)、作業、頑張ってるから、応援したげてね...! 【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 4{
                    text = "\(NAME)ちゃん、作業頑張ってまーす！いぇーい！　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 5{
                    text = "\(NAME)ちゃんちゃんと作業進ませてるよ〜、ほんとだよ〜！...たぶん...? 【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 6{
                    text = "もう、\(NAME)ちゃん作業やってる？サボってたら容赦無く咎めなさいよ。やっちゃいなさい。　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 7{
                    text = "\(NAME)くんの作業は僕が監視しています。サボるようなら許しませんよ！　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 8{
                    text = "\(NAME)は絶賛作業中だ。みんなも監視よろしく頼んだぞ。　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 9{
                    text = "えええっと！\(NAME)さんのし、進捗は僕が管理させていただきます！お、終わらせましょう！　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 10{
                    text = "\(NAME)は作業頑張ってるみたいだけど...まあ、終わらせられるはずだよね〜？　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 11{
                    text = "...\(NAME)さんは、作業中です。...みなさんも応援宜しくお願いします...。　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 12{
                    text = "あー、\(NAME)は作業中だから、みんなもサボってたら適度に急かしてやれよー。よろしくー。　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 13{
                    text = "みなさん！\(NAME)様は作業を頑張っておられます！どうか応援のほどよろしくお願い致します。 【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 14{
                    text = "\(NAME)さんは現在作業中です。　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 15{
                    text = "あはは〜、\(NAME)ちゃん、本当に時間内に終わるのかな？　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 16{
                    text = "ああ、\(NAME)さんは今絶賛作業中ですよ。終わりますかねえ、ひひひっ　【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 17{
                    text = "\(NAME)さん、今は絶賛作業中です！応援宜しくお願いしますね！【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }else if charaNum.object(forKey: "Num") as! Int == 18{
                    text = "おい、今\(NAME)は作業中なんだ！いい具合にほっといてやれよな！ 【あなたと頑張るリマインダー、SHINDo】https://itunes.apple.com/jp/app/shindo/id1287023305?mt=8"
                }
                
                
            let composer = TWTRComposer()
            composer.setText("\(text)")
            composer.show(from: self, completion: nil)
            
   /*         let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            composeViewController.setInitialText(text)
            
            self.present(composeViewController, animated: true, completion: nil)
   */
        
        }
        

        
        
    
        
        }
        
    }
    
    func fetchUsers(withUserIDs userIDs: [String]) {
        let client = TWTRAPIClient()
        let userIDsString = userIDs.joined(separator: ",")
        let params = ["user_id": userIDsString]
        var clientError: NSError?
        
        let url = "https://api.twitter.com/1.1/users/lookup.json"
        let request = client.urlRequest(withMethod: "GET", urlString: url, parameters: params, error: &clientError)
        client.sendTwitterRequest(request) { (response, data, connectionError) in
            // エラーハンドリングとParse処理
            print("sabasaba")
            print(data)
            print("sabasaba")
        }
    }
    
    @IBAction func web() {
        let url = URL(string: "http://shinchokudoudesuka.jimdo.com")
        if UIApplication.shared.canOpenURL(url!){
            UIApplication.shared.openURL(url!)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myLongPressGesture = UILongPressGestureRecognizer(target: self, action: "logout")
        myLongPressGesture.minimumPressDuration = 0.2
        self.twitterButton.addGestureRecognizer(myLongPressGesture)
        
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        print("hoge")
        print(TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers())
        if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            twitterButton.alpha = 1
            twitterButton.isHidden = false
            
        }else{
            
            twitterButton.isHidden = true
            twitterButton.alpha = 0

        }
        
        self.view.backgroundColor = appDelegate.fColor
        
        colorButton.layer.cornerRadius = 0.135*(UIScreen.main.bounds.size.width)
        colorButton.backgroundColor = appDelegate.bColor
        
        webButton.layer.cornerRadius = 0.135*(UIScreen.main.bounds.size.width)
        webButton.backgroundColor = appDelegate.dColor
        
        charaButton.layer.cornerRadius = 0.135*(UIScreen.main.bounds.size.width)
        charaButton.backgroundColor = appDelegate.dColor
        
        tweetButton.layer.cornerRadius = 0.135*(UIScreen.main.bounds.size.width)
        tweetButton.backgroundColor = appDelegate.bColor
        
        
        
        twitterButton.layer.cornerRadius = 0.096*(UIScreen.main.bounds.size.width)
        twitterButton.layer.masksToBounds = true
        twitterButton.backgroundColor = appDelegate.bColor
 //     twitterButtonColor()
        
        
//        func twitterButtonColor() {
//            if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
//                twitterButton.alpha = 0.5
//            }else{
//                twitterButton.alpha = 1
//            }
//        }
//    }

        // Do any additional setup after loading the view.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
}
