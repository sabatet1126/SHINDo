//
//  SetteiCharaViewController.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/04/03.
//  Copyright © 2017年 鯖. All rights reserved.
//
import UIKit
import AVFoundation

class SetteiCharaViewController: UIViewController, AVAudioPlayerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var userDefault : UserDefaults = UserDefaults.standard
    
    var charaNum: UserDefaults = UserDefaults.standard
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var switchBtn: UISwitch!
    @IBOutlet weak var CoachMark: CoachMarkView!
    @IBOutlet var CoachMarklabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefault.object(forKey:"RANDOM") != nil {
            let bool:Bool = userDefault.object(forKey: "RANDOM") as! Bool
            
            switchBtn.setOn(bool, animated: false)
        }else {
            switchBtn.setOn(false, animated: false)
        }
        
        // ここに初期化処理を書く
        
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["thirdLaunch": true]
        // デフォルト値登録
        // ※すでに値が更新されていた場合は、更新後の値のままになる
        userDefault.register(defaults: dict)
        
        // "firstLaunch"に紐づく値がtrueなら(=初回起動)、値をfalseに更新して処理を行う
        if userDefault.bool(forKey: "thirdLaunch") {
            
            
            print("初回起動の時だけ呼ばれるよ")
            CoachMark.x = 0.8*(UIScreen.main.bounds.size.width)
            CoachMark.y = 0.9*(UIScreen.main.bounds.size.height)
        //    CoachMark.x = 360
       //     CoachMark.y = 650
            CoachMarklabel.text = "ONにすることで担当画面で\n数秒ごとに尻叩きボイスを聞くことができます！\n(バックグラウンドでも動作致します。)"
            CoachMarklabel.numberOfLines = 3
            CoachMarklabel.lineBreakMode = NSLineBreakMode.byWordWrapping//NSLineBreakByWordWrapping
            

        }else{
            CoachMark.isHidden = true
            CoachMarklabel.isHidden = true
            self.view.viewWithTag(1)?.removeFromSuperview()
        }
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ONOFF(_ sender: UISwitch) {
        //sender.isOn ? "ON":"OFF"
        print(sender.isOn)
        
        
        if sender.isOn == true {
            if userDefault.bool(forKey: "thirdLaunch") {
                userDefault.set(false, forKey: "thirdLaunch")
                print("22222222222222")
                CoachMark.isHidden = true
                CoachMarklabel.isHidden = true
                self.view.viewWithTag(1)?.removeFromSuperview()
            }
            userDefault.set(true, forKey: "RANDOM")
            
        }else {
            print("2222")
            
            
            userDefault.set(false, forKey: "RANDOM")
            
            
       //     userDefault.set(false, forKey: "thirdLaunch")
        }
        
    }
    
    //女子
    @IBAction func tsubaki() {
        charaNum.set(0, forKey: "Num")
        charaNum.set(0, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ツバキ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.tsubakiarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tb15", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func uta() {
        
        charaNum.set(1, forKey: "Num")
        charaNum.set(1, forKey: "samune")
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ウタ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.utaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "u20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
        
    }
    
    @IBAction func tsutsumi() {
        charaNum.set(2, forKey: "Num")
        charaNum.set(2, forKey: "samune")
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ツツミ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.honokaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tutumi020", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func veronika() {
        charaNum.set(3, forKey: "Num")
        charaNum.set(3, forKey: "samune")
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ヴェロニカ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.veronicaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ve16", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func candith() {
        charaNum.set(4, forKey: "Num")
        charaNum.set(4, forKey: "samune")
        
        
        
        appDelegate.textArray = appDelegate.chanditharray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        
        
        //   audioPlayer.delegate = self
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ca11", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            
            
            print(audioPath)
        }
        catch {
            print("AVAudioPlayer error")
        }
        audioPlayer.play()
        
        
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【キャンディス】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func sonia() {
        charaNum.set(5, forKey: "Num")
        charaNum.set(5, forKey: "samune")
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ソニア】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.soniaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SNA-12", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func hibari() {
        charaNum.set(6, forKey: "Num")
        charaNum.set(6, forKey: "samune")
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ヒバリ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.hibariarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "HBR-14", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    
    //男子
    @IBAction func amenomiya() {
        charaNum.set(7, forKey: "Num")
        charaNum.set(7, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【アメノミヤ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.amenomiyaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "am-20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func souji() {
        charaNum.set(8, forKey: "Num")
        charaNum.set(8, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ソウジ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.soujiarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "souji16", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func kotaro() {
        charaNum.set(9, forKey: "Num")
        charaNum.set(9, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【コタロー】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.kotaroarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ko15", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func minato() {
        charaNum.set(10, forKey: "Num")
        charaNum.set(10, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ミナト】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.minatoarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "11A", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func issiki() {
        charaNum.set(11, forKey: "Num")
        charaNum.set(11, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【イッシキ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.issikiarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ISK-20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func akutsu() {
        charaNum.set(12, forKey: "Num")
        charaNum.set(12, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【アクツ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.akutsuarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ak16", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func nothingum() {
        charaNum.set(13, forKey: "Num")
        charaNum.set(13, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ノッティンガム】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.nottinghamarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ntg-16", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    
    @IBAction func noa() {
        charaNum.set(14, forKey: "Num")
        charaNum.set(14, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ノア】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.noaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "n_20_A", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    @IBAction func yurichika() {
        charaNum.set(15, forKey: "Num")
        charaNum.set(15, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ユリチカ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.yurichikaarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Y20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    @IBAction func kaito() {
        charaNum.set(16, forKey: "Num")
        charaNum.set(16, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【カイト】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.kaitoarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "B20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    @IBAction func oliver() {
        charaNum.set(17, forKey: "Num")
        charaNum.set(17, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【オリバー】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.oliverarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "o_20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    @IBAction func ryuji() {
        charaNum.set(18, forKey: "Num")
        charaNum.set(18, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【リュウジ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.ryujiarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "k20", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
        
    }
    @IBAction func yuzuha() {
        charaNum.set(19, forKey: "Num")
        charaNum.set(19, forKey: "samune")
        
        let alertController = UIAlertController(title: "進捗管理人登録", message: "進捗管理人を【ユズハ】に変更しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        appDelegate.textArray = appDelegate.ryujiarray
        userDefault.set(appDelegate.textArray,forKey: "serifu")
        userDefault.synchronize()
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "S_00", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch {
            print("AVAudioPlayer error")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        print("初回起動じゃなくても呼ばれるアプリ起動時の処理だよ")
    
    
    
    
    
    
    
    
    
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
