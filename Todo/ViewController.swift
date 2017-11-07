//
//  ViewController.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/01/10.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController, AVAudioPlayerDelegate,UITableViewDelegate{
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var colorData : UserDefaults = UserDefaults.standard
    var defaults: UserDefaults = UserDefaults.standard
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var serifu: UILabel!
    @IBOutlet weak var illust2: UIImageView!
    
    @IBOutlet weak var CoachMark: CoachMarkView!
    @IBOutlet weak var View2: UIView!
    
    //toDOリスト
    @IBOutlet weak var todolistTable: UITableView!
    
    @IBAction func back(_ segue: UIStoryboardSegue) {
        
    }
    //着せ替え配列
    
    var serifuData : UserDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        
        // ここに初期化処理を書く
        // UserDefaultsを使ってフラグを保持する
        let userDefault = UserDefaults.standard
        // "firstLaunch"をキーに、Bool型の値を保持する
        let dict = ["firstLaunch": true]
        // デフォルト値登録
        // ※すでに値が更新されていた場合は、更新後の値のままになる
        userDefault.register(defaults: dict)
        
        // "firstLaunch"に紐づく値がtrueなら(=初回起動)、値をfalseに更新して処理を行う
        if userDefault.bool(forKey: "firstLaunch") {
            userDefault.set(false, forKey: "firstLaunch")
            print("初回起動の時だけ呼ばれるよ")
            CoachMark.x = 390
            CoachMark.y = 60
        }else{
            CoachMark.isHidden = true
            
        }
        
        print("初回起動じゃなくても呼ばれるアプリ起動時の処理だよ")
        
        var charasamune:Int = 0
        var charaImage2 = ["サムネツバキ.png","サムネウタ.png","サムネツツミ.png","サムネヴェロ.png","サムネキャンディス.png","サムネソニア.png","サムネヒバリ.png","サムネアメノミヤ.png","サムネソージ.png","サムネコタロー.png","サムネミナト.png","サムネイッシキ.png","サムネ阿久津.png","サムネノッティンガム.png","サムネノア.png","サムネユリチカ.png","サムネカイト.png","サムネオリバー.png","サムネリュウジ.png"]
        
        if defaults.object(forKey: "samune") != nil {
            charasamune = defaults.object(forKey: "samune") as! Int
        }
        
        illust2.image = UIImage(named: charaImage2[charasamune])
        
        
        if let serifu = serifuData.array(forKey: "serifu") as? [String] {
            appDelegate.textArray = serifu
        }
        
        if let index = serifuData.integer(forKey: "color") as? Int {
            if index == 0 {
                appDelegate.aColor = appDelegate.kyoutsuWHITE
                appDelegate.bColor = appDelegate.tsubakiRED
                appDelegate.cColor = appDelegate.tsubakiBROWN
                appDelegate.dColor = appDelegate.tsubakiBLUE
                appDelegate.eColor = appDelegate.utaBLACK
                appDelegate.fColor = appDelegate.tsubakiBack
            }else if index == 1{
                appDelegate.aColor = appDelegate.kyoutsuWHITE
                appDelegate.bColor = appDelegate.tsubakiRED
                appDelegate.cColor = appDelegate.tsubakiBROWN
                appDelegate.dColor = appDelegate.tsubakiBLUE
                appDelegate.eColor = appDelegate.utaBLACK
                appDelegate.fColor = appDelegate.tsubakiBack
            }else if index == 2{
                appDelegate.aColor = appDelegate.utaWHITE
                appDelegate.bColor = appDelegate.utaBROWN
                appDelegate.cColor = appDelegate.utaCOLORGRAY
                appDelegate.dColor = appDelegate.utaGRAY
                appDelegate.eColor = appDelegate.utaBLACK
                appDelegate.fColor = appDelegate.utaBack
            }else if index == 3{
                appDelegate.aColor = appDelegate.honokaBLACK
                appDelegate.bColor = appDelegate.honokaPINK
                appDelegate.cColor = appDelegate.honokaBLUE
                appDelegate.dColor = appDelegate.honokaVIORET
                appDelegate.eColor = appDelegate.honokaBLACK
                appDelegate.fColor = appDelegate.honokaBack
            }else if index == 4{
                appDelegate.aColor = appDelegate.veronicaBLUE
                appDelegate.bColor = appDelegate.veronicaBROWN
                appDelegate.cColor = appDelegate.veronicaGRAY
                appDelegate.dColor = appDelegate.veronicaGREEN
                appDelegate.eColor = appDelegate.veronicaGREEN
                appDelegate.fColor = appDelegate.veronicaBack
            }else if index == 5{
                appDelegate.aColor = appDelegate.chandithYELLOW
                appDelegate.bColor = appDelegate.chandithRED
                appDelegate.cColor = appDelegate.chandithGREEN
                appDelegate.dColor = appDelegate.chandithblue
                appDelegate.eColor = UIColor.black
                appDelegate.fColor = appDelegate.chandithBack
                
            }else if index == 6{
                appDelegate.aColor = appDelegate.kyoutsuWHITE
                appDelegate.bColor = appDelegate.soniaVIORET
                appDelegate.cColor = appDelegate.soniaRED
                appDelegate.dColor = appDelegate.soniaWINE
                appDelegate.eColor = appDelegate.soniaBLACK
                appDelegate.fColor = appDelegate.soniaBack
            }else if index == 7{
                appDelegate.aColor = appDelegate.hibariWHITE
                appDelegate.bColor = appDelegate.hibariRED
                appDelegate.cColor = appDelegate.hibariVIORET
                appDelegate.dColor = appDelegate.hibariBLUE
                appDelegate.eColor = appDelegate.hibariBLACK
                appDelegate.fColor = appDelegate.hibariBack
                
            }else if index == 8{
                appDelegate.aColor = appDelegate.kyoutsuWHITE
                appDelegate.bColor = appDelegate.amenomiyaBLUE
                appDelegate.cColor = appDelegate.amenomiyaBROWN
                appDelegate.dColor = appDelegate.amenomiyaRED
                appDelegate.eColor = appDelegate.utaBLACK
                appDelegate.fColor = appDelegate.amenomiyaBack
            }else if index == 9{
                appDelegate.aColor = appDelegate.soujiWHITE
                appDelegate.bColor = appDelegate.soujiBLUE
                appDelegate.cColor = appDelegate.soujiGREEN
                appDelegate.dColor = appDelegate.soujiSKYBLUE
                appDelegate.eColor = appDelegate.soujiBLACK
                appDelegate.fColor = appDelegate.soujiBack
            }else if index == 10{
                appDelegate.aColor = appDelegate.kotaroBLUE
                appDelegate.bColor = appDelegate.kotaroTIFANY
                appDelegate.cColor = appDelegate.kotaroGREEN
                appDelegate.dColor = appDelegate.kotaroSKY
                appDelegate.eColor = appDelegate.kotaroBLACK
                appDelegate.fColor = appDelegate.kotaroBack
            }else if index == 11{
                appDelegate.aColor = appDelegate.minatoWHITE
                appDelegate.bColor = appDelegate.minatoORANGE
                appDelegate.cColor = appDelegate.minatoRED
                appDelegate.dColor = appDelegate.minatoYELLOW
                appDelegate.eColor = appDelegate.minatoBLACK
                appDelegate.fColor = appDelegate.minatoBack
            }else if index == 12 {
                appDelegate.aColor = appDelegate.issikiWHITE
                appDelegate.bColor = appDelegate.issikiPINK
                appDelegate.cColor = appDelegate.issikiYELLOW
                appDelegate.dColor = appDelegate.issikiBLUE
                appDelegate.eColor = appDelegate.issikiVIORET
                appDelegate.fColor = appDelegate.issikiBack
            }else if index == 13{
                appDelegate.aColor = appDelegate.akutsuWHITE
                appDelegate.bColor = appDelegate.akutsuRED
                appDelegate.cColor = appDelegate.nottinghamBROWN
                appDelegate.dColor = appDelegate.akutsuORANGE
                appDelegate.eColor = appDelegate.akutsuBLACK
                appDelegate.fColor = appDelegate.akutsuBack
            }else if index == 14{
                appDelegate.aColor = appDelegate.nottinghamWHITE
                appDelegate.bColor = appDelegate.nottinghamWINW
                appDelegate.cColor = appDelegate.nottinghamRED
                appDelegate.dColor = appDelegate.nottinghamPINK
                appDelegate.eColor = appDelegate.nottinghamBROWN
                appDelegate.fColor = appDelegate.nottinghamBack
            }else if index == 15{
                appDelegate.aColor = appDelegate.noaWHITE
                appDelegate.bColor = appDelegate.noaBLACK
                appDelegate.cColor = appDelegate.noaGREEN
                appDelegate.dColor = appDelegate.noaLIME
                appDelegate.eColor = appDelegate.noaYELLOW
                appDelegate.fColor = appDelegate.noaBack
                
            }else if index == 16{
                appDelegate.aColor = appDelegate.yurichikaRED
                appDelegate.bColor = appDelegate.yurichikaWHITE
                appDelegate.cColor = appDelegate.yurichikaYELLOW
                appDelegate.dColor = appDelegate.yurichikaGREEN
                appDelegate.eColor = appDelegate.yurichikaORANGE
                appDelegate.fColor = appDelegate.yurichikaBack
            }else if index == 17{
                appDelegate.aColor = appDelegate.kaitoSKY
                appDelegate.bColor = appDelegate.kaitoBLACK
                appDelegate.cColor = appDelegate.kaitoBLUE
                appDelegate.dColor = appDelegate.kaitoPURPLE
                appDelegate.eColor = appDelegate.kaitoVIORET
                appDelegate.fColor = appDelegate.kaitoBack
            }else if index == 18{
                appDelegate.aColor = appDelegate.oliverWHITE
                appDelegate.bColor = appDelegate.oliverBLACK
                appDelegate.cColor = appDelegate.oliverPINK
                appDelegate.dColor = appDelegate.oliverGRAY
                appDelegate.eColor = appDelegate.oliverGREEN
                appDelegate.fColor = appDelegate.oliverBack
            }else if index == 19{
                appDelegate.aColor = appDelegate.ryujiWHITE
                appDelegate.bColor = appDelegate.ryujiBLACK
                appDelegate.cColor = appDelegate.ryujiBLUE
                appDelegate.dColor = appDelegate.ryujiGRAY
                appDelegate.eColor = appDelegate.ryujiYELLOW
                appDelegate.fColor = appDelegate.ryujiBack
                
            }
        }
        
        if UserDefaults.standard.object(forKey: "todoList") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todoList") as! [String]
        }
        if UserDefaults.standard.object(forKey: "Date") != nil {
            DateItem = UserDefaults.standard.object(forKey: "Date") as! [String]
        }
        
        todolistTable.backgroundColor = appDelegate.fColor
        View2.backgroundColor = appDelegate.aColor
        serifu.numberOfLines = 3
        serifu.lineBreakMode = NSLineBreakMode.byWordWrapping//NSLineBreakByWordWrapping
        
        //サムネ
        if defaults.object(forKey: "samune") != nil {
            charasamune = defaults.object(forKey: "samune") as! Int
        }
        
        illust2.image = UIImage(named: charaImage2[charasamune])
        //キャラサムネ
    }
    //NSUserDefalts出した
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        todolistTable.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
  
        
        
    }
    
    
        
    
    
    @IBAction func fukidashi() {
        let serifuArray: [String] = appDelegate.textArray
        let index = Int(arc4random_uniform(9))
        serifu.text = serifuArray[index]
    }
    
    
    
    //元からある
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //tableViewの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    //表示
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.YOTEILabel.text = todoItem[indexPath.row]
        cell.HIZUKELabel.text = DateItem[indexPath.row]
        
        cell.YOTEILabel.textColor = UIColor.black
        cell.HIZUKELabel.textColor = UIColor.black
        
        
          
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = appDelegate.bColor
            cell.YOTEILabel.textColor = appDelegate.aColor
            cell.HIZUKELabel.textColor = appDelegate.aColor
            
            
        } else {
            
            cell.backgroundColor = appDelegate.aColor
            cell.YOTEILabel.textColor = appDelegate.bColor
            cell.HIZUKELabel.textColor = appDelegate.bColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            DateItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todoList")
            UserDefaults.standard.set(DateItem, forKey: "Date")
            
            todolistTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todolistTable.deselectRow(at: indexPath, animated: true)
    }
    
  
    func tableView(_ tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [AnyObject]? {
        
        
        // 褒めるボタン.
        let OKButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "完了!") { (action, index) -> Void in
            
            todoItem.remove(at: indexPath.row)
            DateItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todoList")
            UserDefaults.standard.set(DateItem, forKey: "Date")
            
            tableView.isEditing = false
            print("完了")
            
            self.todolistTable.reloadData()
            
            
            var charaNum:UserDefaults = UserDefaults.standard
            
            var musicDate = MusicData()
            
            var musicArr:[String] = [String]()
            
            print(charaNum.object(forKey: "Num"))
            
            if charaNum.object(forKey: "Num") as! Int == 0 {
                musicArr = musicDate.tsubakiVoice[0]
                print(musicArr)
            }else if charaNum.object(forKey: "Num")as! Int == 1{
                musicArr = musicDate.utaVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 2{
                musicArr = musicDate.tsutsumiVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 3{
                musicArr = musicDate.veronicaVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 4{
                musicArr = musicDate.chandithVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 5{
                musicArr = musicDate.soniaVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 6{
                musicArr = musicDate.hibariVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 7{
                musicArr = musicDate.amenomiyaVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 8{
                musicArr = musicDate.soujiVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 9{
                musicArr = musicDate.kotaroVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 10{
                musicArr = musicDate.minatoVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 11{
                musicArr = musicDate.issikiVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 12{
                musicArr = musicDate.akutsuVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 13{
                musicArr = musicDate.notthinghamVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 14{
                musicArr = musicDate.noaVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 15{
                musicArr = musicDate.yurichikaVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 16{
                musicArr = musicDate.kaitoVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 17{
                musicArr = musicDate.oliverVoice[0]
            }else if charaNum.object(forKey: "Num")as! Int == 18{
                musicArr = musicDate.ryujiVoice[0]
            }
            
            print(musicArr)
            
            var rand = Int(arc4random_uniform(UInt32(musicArr.count-1)))
            
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
        OKButton.backgroundColor = appDelegate.dColor
        
        // 削除ボタン.
        let SakuzyoButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            
            todoItem.remove(at: indexPath.row)
            DateItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItem, forKey: "todoList")
            UserDefaults.standard.set(DateItem, forKey: "Date")
            tableView.isEditing = false
            print("削除")
            
            self.todolistTable.reloadData()
        }
        SakuzyoButton.backgroundColor = appDelegate.cColor
        
        return [OKButton,SakuzyoButton]
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        todolistTable.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        serifu.text = "進捗どうですか？"
    }
}




//リロード

//
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
//        if editingStyle == UITableViewCellEditingStyle.Delete{
//            todoItem.removeAtIndex(indexPath.row)
//            DateItem.removeAtIndex(indexPath.row)
//            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
//            NSUserDefaults.standardUserDefaults().setObject(DateItem, forKey: "Date")
//
//            todolistTable.reloadData()
//        }


//        let myDeleteButton = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "完了！") { (action, indexPath) -> Void in
//            todoItem.removeAtIndex(indexPath.row)
//            DateItem.removeAtIndex(indexPath.row)
//            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
//            NSUserDefaults.standardUserDefaults().setObject(DateItem, forKey: "Date")
//
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
//
//
//
//            self.todolistTable.reloadData()
//
//        }
//        myDeleteButton.backgroundColor = UIColor.blueColor()

