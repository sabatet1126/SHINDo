//
//  HOMETEViewcountroller.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/04/03.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit
import AVFoundation
//何故か「ほめて」と「けなして」位置が反転しているので直したいが位置が行方不明　聞く

class HOMETEViewController: UIViewController , AVAudioPlayerDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBOutlet weak var CoachMark: CoachMarkView!
    @IBOutlet var CoachMarklabel: UILabel!
    @IBOutlet weak var hometeButton: UIButton!
    @IBOutlet weak var kenashiteButton: UIButton!
    @IBOutlet weak var illust: UIImageView!
    @IBOutlet var hometehaikei: UIView!
    @IBOutlet var kenashitehaikei: UIView!
    var index = 0
    var audioPlayer: AVAudioPlayer!
    // バックグラウンドでの音の再生を許可
    var secondArray: [String] = ["担当画面へようこそ！\nここでは上部をタップすると\nあなたの管理人が持ち上げ、","下部タップであなたの管理人が\n尻叩きしちゃいます！","設定画面→さぎょいぷ機能ONで\n数秒ごとにあなたを急かさせていただきます！\n(バックグラウンドでも動作致します。)"]
    
    
    var defaults: UserDefaults = UserDefaults.standard
    
    var charaNum:Int = 0
    
    var switchBool:Bool = false
    
    var charaImage = ["0つばき.png","0ウタ.png","0ツツミ.png","0ヴェロニカ.png","0キャンディス.png","0ソニア.png","0ヒバリ.png","0アメノミヤ.png","0ソウジ.png","0コタロー.png","0湊.png","0イッシキ.png","0阿久津.png","0ノッティンガム.png","SDノア.png","SDユリチカ.png","SD怪人.png","SDオリバー.png","SD龍仁.png"]
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.object(forKey: "Num") != nil {
            charaNum = defaults.object(forKey: "Num") as! Int
        }
        
        if defaults.object(forKey: "RANDOM") != nil {
            switchBool = defaults.object(forKey: "RANDOM") as! Bool
            
            
            print(switchBool)
        }
        
        illust.image = UIImage(named: charaImage[charaNum])
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        hometehaikei.backgroundColor = appDelegate.bColor
        kenashitehaikei.backgroundColor = appDelegate.dColor
       let userDefault = UserDefaults.standard
        
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["secondLaunch": true]
        // デフォルト値登録
        // ※すでに値が更新されていた場合は、更新後の値のままになる
        userDefault.register(defaults: dict)
        
        // "firstLaunch"に紐づく値がtrueなら(=初回起動)、値をfalseに更新して処理を行う
        if userDefault.bool(forKey: "secondLaunch") {
            // userDefault.set(false, forKey: "secondLaunch")
            print("初回起動の時だけ呼ばれるよ")
            CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
            CoachMark.y = 0.2*(UIScreen.main.bounds.size.height)
            
            // ここに初期化処理を書く
            CoachMarklabel.text = secondArray[index]
            CoachMarklabel.numberOfLines = 3
            CoachMarklabel.lineBreakMode = NSLineBreakMode.byWordWrapping//NSLineBreakByWordWrapping
            
            // UserDefaultsを使ってフラグを保持する
            
            
            
        }else{
            CoachMark.isHidden = true
            CoachMarklabel.isHidden = true
        }
        
        print("初回起動じゃなくても呼ばれるアプリ起動時の処理だよ")
        
        
        
        print(defaults.object(forKey: "Num"))
        
        if defaults.object(forKey: "Num") != nil {
            charaNum = defaults.object(forKey: "Num") as! Int
        }
        
        
        if defaults.object(forKey: "RANDOM") != nil {
            switchBool = defaults.object(forKey: "RANDOM") as! Bool
        }
        
        /// バックグラウンドでも再生できるカテゴリに設定する
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback)
        } catch  {
            // エラー処理
            fatalError("カテゴリ設定失敗")
        }
        
        // sessionのアクティブ化
        do {
            try session.setActive(true)
        } catch {
            // audio session有効化失敗時の処理
            // (ここではエラーとして停止している）
            fatalError("session有効化失敗")
        }
        
        
        print(switchBool)
        
        
        if switchBool == true {
            
            //         if timer == nil{
            //タイマーをオンにするコード
            timer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector:"soundTimer", userInfo: nil,repeats: true)
            
            //        }
            
            timer.fire()
        }
        
        
        illust.image = UIImage(named: charaImage[charaNum])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if timer != nil {
            timer.invalidate()
            
            print("タイマーが空かチェック")
            print(timer)
        }
        
    }
    
    
    
    
    func soundTimer() {
        //musicDataから音を再生
        
        
        var charaNum:UserDefaults = UserDefaults.standard
        
        var musicDate = MusicData()
        
        var musicArr:[String] = [String]()
        
        print(charaNum.object(forKey: "Num"))
        
        
        if charaNum.object(forKey: "Num") as! Int == 0 {
            musicArr = musicDate.tsubakiVoice[4]
            print(musicArr)
        }else if charaNum.object(forKey: "Num")as! Int == 1{
            musicArr = musicDate.utaVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 2{
            musicArr = musicDate.tsutsumiVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 3{
            musicArr = musicDate.veronicaVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 4{
            musicArr = musicDate.chandithVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 5{
            musicArr = musicDate.soniaVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 6{
            musicArr = musicDate.hibariVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 7{
            musicArr = musicDate.amenomiyaVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 8{
            musicArr = musicDate.soujiVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 9{
            musicArr = musicDate.kotaroVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 10{
            musicArr = musicDate.minatoVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 11{
            musicArr = musicDate.issikiVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 12{
            musicArr = musicDate.akutsuVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 13{
            musicArr = musicDate.notthinghamVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 14{
            musicArr = musicDate.noaVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 15{
            musicArr = musicDate.yurichikaVoice[4]
            print(musicArr)
        }else if charaNum.object(forKey: "Num")as! Int == 16{
            musicArr = musicDate.kaitoVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 17{
            musicArr = musicDate.oliverVoice[4]
        }else if charaNum.object(forKey: "Num")as! Int == 18{
            musicArr = musicDate.ryujiVoice[4]
        }
        
        
        print(musicArr)
        
        var rand = Int(arc4random_uniform(UInt32(musicArr.count-1)))
        print(rand)
        let soundFilePath:String = Bundle.main.path(forResource: musicArr[rand], ofType: "mp3")!
        
        // swift2系からtryでエラー処理するようなので、do〜try〜catchで対応
        do {
            let fileURL : URL = URL(fileURLWithPath: soundFilePath)
            self.audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            self.audioPlayer.delegate = self
            self.audioPlayer.play()
            print("いんすたんすおっけー")
        }
            // playerを作成した時にエラーがthrowされたらこっち来る
        catch {
            print("いんすたんすむり")
        }
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func homete() {
        let userDefault = UserDefaults.standard
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["secondLaunch": true]
        userDefault.register(defaults: dict)
        
        if userDefault.bool(forKey: "secondLaunch") {
            
            if index == 0 {
                CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
                CoachMark.y = 0.6*(UIScreen.main.bounds.size.height)
                index += 1
                print(index)
                CoachMarklabel.text  = secondArray[0]
                print("ござる")
            }else if index == 1{
                CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
                CoachMark.y = 0.2*(UIScreen.main.bounds.size.height)
                index += 1
                print(index)
                CoachMarklabel.text  = secondArray[1]
                print("ござる")
            }else if index == 2{
                CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
                CoachMark.y = 0.6*(UIScreen.main.bounds.size.height)
                index += 1
                print(index)
                CoachMarklabel.text  = secondArray[2]
                print("ござる")
            }else if index == 3{
                userDefault.set(false, forKey: "secondLaunch")
                CoachMark.isHidden = true
                CoachMarklabel.isHidden = true
                print(index)
                print("ござる")
            }
            
        }
        var charaNum:UserDefaults = UserDefaults.standard
        
        var musicDate = MusicData()
        
        var musicArr:[String] = [String]()
        
        print(charaNum.object(forKey: "Num"))
        
        
        if charaNum.object(forKey: "Num") as! Int == 0 {
            musicArr = musicDate.tsubakiVoice[1]
            print(musicArr)
        }else if charaNum.object(forKey: "Num")as! Int == 1{
            musicArr = musicDate.utaVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 2{
            musicArr = musicDate.tsutsumiVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 3{
            musicArr = musicDate.veronicaVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 4{
            musicArr = musicDate.chandithVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 5{
            musicArr = musicDate.soniaVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 6{
            musicArr = musicDate.hibariVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 7{
            musicArr = musicDate.amenomiyaVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 8{
            musicArr = musicDate.soujiVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 9{
            musicArr = musicDate.kotaroVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 10{
            musicArr = musicDate.minatoVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 11{
            musicArr = musicDate.issikiVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 12{
            musicArr = musicDate.akutsuVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 13{
            musicArr = musicDate.notthinghamVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 14{
            musicArr = musicDate.noaVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 15{
            musicArr = musicDate.yurichikaVoice[1]
            print(musicArr)
        }else if charaNum.object(forKey: "Num")as! Int == 16{
            musicArr = musicDate.kaitoVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 17{
            musicArr = musicDate.oliverVoice[1]
        }else if charaNum.object(forKey: "Num")as! Int == 18{
            musicArr = musicDate.ryujiVoice[1]
        }
        
        
        
        print(musicArr)
        
        var rand = Int(arc4random_uniform(UInt32(musicArr.count-1)))
        print(rand)
        let soundFilePath:String = Bundle.main.path(forResource: musicArr[rand], ofType: "mp3")!
        
        
        do {
            let fileURL : URL = URL(fileURLWithPath: soundFilePath)
            self.audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            self.audioPlayer.delegate = self
            self.audioPlayer.play()
            print("いんすたんす、おっけー")
        }
            // playerを作成した時にエラーがthrowされたらこっち来る
        catch {
            print("いんすたんす、むり")
        }
        
        
        
        // hometeButton.setTitle(" ", for: UIControlState())
        
        
    }
    
    @IBAction func kenashite() {
        let userDefault = UserDefaults.standard
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["secondLaunch": true]
        userDefault.register(defaults: dict)
        
        if userDefault.bool(forKey: "secondLaunch") {
            
            if index == 0 {
                CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
                CoachMark.y = 0.6*(UIScreen.main.bounds.size.height)
                index += 1
                print(index)
                CoachMarklabel.text  = secondArray[0] as String!
                print("ござる")
            }else if index == 1{
                CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
                CoachMark.y = 0.2*(UIScreen.main.bounds.size.height)
                index += 1
                print(index)
                CoachMarklabel.text  = secondArray[1] as String!
                print("ござる")
            }else if index == 2{
                CoachMark.x = 0.5*(UIScreen.main.bounds.size.width)
                CoachMark.y = 0.6*(UIScreen.main.bounds.size.height)
                index += 1
                print(index)
                print("ござる")
                CoachMarklabel.text  = secondArray[2] as String!
            }else if index == 3{
                userDefault.set(false, forKey: "secondLaunch")
                CoachMark.isHidden = true
                CoachMarklabel.isHidden = true
                print(index)
                print("ござる")
            }
            
        }
        // kenashiteButton.setTitle(" ", for: UIControlState())
        var charaNum:UserDefaults = UserDefaults.standard
        
        var musicDate = MusicData()
        
        var musicArr:[String] = [String]()
        
        print(charaNum.object(forKey: "Num"))
        
        if charaNum.object(forKey: "Num") as! Int == 0 {
            musicArr = musicDate.tsubakiVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 1{
            musicArr = musicDate.utaVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 2{
            musicArr = musicDate.tsutsumiVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 3{
            musicArr = musicDate.veronicaVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 4{
            musicArr = musicDate.chandithVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 5{
            musicArr = musicDate.soniaVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 6{
            musicArr = musicDate.hibariVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 7{
            musicArr = musicDate.amenomiyaVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 8{
            musicArr = musicDate.soujiVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 9{
            musicArr = musicDate.kotaroVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 10{
            musicArr = musicDate.minatoVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 11{
            musicArr = musicDate.issikiVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 12{
            musicArr = musicDate.akutsuVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 13{
            musicArr = musicDate.notthinghamVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 14{
            musicArr = musicDate.noaVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 15{
            musicArr = musicDate.yurichikaVoice[2]
            
        }else if charaNum.object(forKey: "Num")as! Int == 16{
            musicArr = musicDate.kaitoVoice[2]
            
        }else if charaNum.object(forKey: "Num")as! Int == 17{
            musicArr = musicDate.oliverVoice[2]
        }else if charaNum.object(forKey: "Num")as! Int == 18{
            musicArr = musicDate.ryujiVoice[2]
        }
        
        print(musicArr)
        
        
        var rand = Int(arc4random_uniform(UInt32(musicArr.count-1)))
        print(musicArr[rand])
        
        
        let soundFilePath:String = Bundle.main.path(forResource: musicArr[rand], ofType: "mp3")!
        
        
        do {
            let fileURL : URL = URL(fileURLWithPath: soundFilePath)
            self.audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            self.audioPlayer.delegate = self
            self.audioPlayer.play()
            print("いんすたんすおっけー")
        }
            // playerを作成した時にエラーがthrowされたらこっち来る
        catch {
            print("いんすたんすむり")
        }
        
        
        
        
        
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
