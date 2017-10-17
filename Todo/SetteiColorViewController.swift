//
//  SetteiColorViewController.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/04/03.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit

class SetteiColorViewController: UIViewController {
    

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var colorData : UserDefaults = UserDefaults.standard
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    
    //女子
    @IBAction func tsubaki() {
        appDelegate.aColor = appDelegate.kyoutsuWHITE
        appDelegate.bColor = appDelegate.tsubakiRED
        appDelegate.cColor = appDelegate.tsubakiBROWN
        appDelegate.dColor = appDelegate.tsubakiBLUE
        appDelegate.eColor = appDelegate.utaBLACK
        appDelegate.fColor = appDelegate.tsubakiBack
        appDelegate.colorIndex = 1
        
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ツバキ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        appDelegate.colorIndex = 1
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()    }
    
    @IBAction func uta() {
        appDelegate.aColor = appDelegate.utaWHITE
        appDelegate.bColor = appDelegate.utaBROWN
        appDelegate.cColor = appDelegate.utaCOLORGRAY
        appDelegate.dColor = appDelegate.utaGRAY
        appDelegate.eColor = appDelegate.utaBLACK
        appDelegate.fColor = appDelegate.utaBack
        appDelegate.colorIndex = 2
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ウタ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)

        appDelegate.colorIndex = 2
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
        
    }
    
    @IBAction func tsutsumi() {
        appDelegate.aColor = appDelegate.honokaBLACK
        appDelegate.bColor = appDelegate.honokaPINK
        appDelegate.cColor = appDelegate.honokaBLUE
        appDelegate.dColor = appDelegate.honokaVIORET
        appDelegate.eColor = appDelegate.honokaBLACK
        appDelegate.fColor = appDelegate.honokaBack
        appDelegate.colorIndex = 3
        
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ツツミ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)

        appDelegate.colorIndex = 3
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func veronika() {
        appDelegate.aColor = appDelegate.veronicaBLUE
        appDelegate.bColor = appDelegate.veronicaBROWN
        appDelegate.cColor = appDelegate.veronicaGRAY
        appDelegate.dColor = appDelegate.veronicaGREEN
        appDelegate.eColor = appDelegate.veronicaGREEN
        appDelegate.fColor = appDelegate.veronicaBack
        appDelegate.colorIndex = 4
        
        
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ヴェロニカ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        appDelegate.colorIndex = 4
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func candith() {
        appDelegate.aColor = appDelegate.chandithYELLOW
        appDelegate.bColor = appDelegate.chandithRED
        appDelegate.cColor = appDelegate.chandithGREEN
        appDelegate.dColor = appDelegate.chandithblue
        appDelegate.eColor = UIColor.black
        appDelegate.fColor = appDelegate.chandithBack
        appDelegate.colorIndex = 5
        
        
        let alertController = UIAlertController(title: "色登録", message: "色設定を【キャンディス】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        appDelegate.colorIndex = 5
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()

    }
    
    @IBAction func sonia() {
        appDelegate.aColor = appDelegate.kyoutsuWHITE
        appDelegate.bColor = appDelegate.soniaVIORET
        appDelegate.cColor = appDelegate.soniaRED
        appDelegate.dColor = appDelegate.soniaWINE
        appDelegate.eColor = appDelegate.soniaBLACK
        appDelegate.fColor = appDelegate.soniaBack
        appDelegate.colorIndex = 6
        
        
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ソニア】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 6
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func hibari() {
        appDelegate.aColor = appDelegate.hibariWHITE
        appDelegate.bColor = appDelegate.hibariRED
        appDelegate.cColor = appDelegate.hibariVIORET
        appDelegate.dColor = appDelegate.hibariBLUE
        appDelegate.eColor = appDelegate.hibariBLACK
        appDelegate.fColor = appDelegate.hibariBack
        appDelegate.colorIndex = 7
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ヒバリ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 7
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    
    //男子
    @IBAction func amenomiya() {
        appDelegate.aColor = appDelegate.kyoutsuWHITE
        appDelegate.bColor = appDelegate.amenomiyaBLUE
        appDelegate.cColor = appDelegate.amenomiyaBROWN
        appDelegate.dColor = appDelegate.amenomiyaRED
        appDelegate.eColor = appDelegate.utaBLACK
        appDelegate.fColor = appDelegate.amenomiyaBack
        appDelegate.colorIndex = 8
        let alertController = UIAlertController(title: "色登録", message: "色設定を【アメノミヤ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 8
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func souji() {
        appDelegate.aColor = appDelegate.soujiWHITE
        appDelegate.bColor = appDelegate.soujiBLUE
        appDelegate.cColor = appDelegate.soujiGREEN
        appDelegate.dColor = appDelegate.soujiSKYBLUE
        appDelegate.eColor = appDelegate.soujiBLACK
        appDelegate.fColor = appDelegate.soujiBack
        appDelegate.colorIndex = 9
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ソウジ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 9
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func kotaro() {
        appDelegate.aColor = appDelegate.kotaroBLUE
        appDelegate.bColor = appDelegate.kotaroTIFANY
        appDelegate.cColor = appDelegate.kotaroGREEN
        appDelegate.dColor = appDelegate.kotaroSKY
        appDelegate.eColor = appDelegate.kotaroBLACK
        appDelegate.fColor = appDelegate.kotaroBack
        appDelegate.colorIndex = 10
        let alertController = UIAlertController(title: "色登録", message: "色設定を【コタロー】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 10
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func minato() {
        appDelegate.aColor = appDelegate.minatoWHITE
        appDelegate.bColor = appDelegate.minatoORANGE
        appDelegate.cColor = appDelegate.minatoRED
        appDelegate.dColor = appDelegate.minatoYELLOW
        appDelegate.eColor = appDelegate.minatoBLACK
        appDelegate.fColor = appDelegate.minatoBack
        appDelegate.colorIndex = 11
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ミナト】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 11
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func issiki() {
        appDelegate.aColor = appDelegate.issikiWHITE
        appDelegate.bColor = appDelegate.issikiPINK
        appDelegate.cColor = appDelegate.issikiYELLOW
        appDelegate.dColor = appDelegate.issikiBLUE
        appDelegate.eColor = appDelegate.issikiVIORET
        appDelegate.fColor = appDelegate.issikiBack
        appDelegate.colorIndex = 12
        let alertController = UIAlertController(title: "色登録", message: "色設定を【イッシキ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 12
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func akutsu() {
        appDelegate.aColor = appDelegate.akutsuWHITE
        appDelegate.bColor = appDelegate.akutsuRED
        appDelegate.cColor = appDelegate.nottinghamBROWN
        appDelegate.dColor = appDelegate.akutsuORANGE
        appDelegate.eColor = appDelegate.akutsuBLACK
        appDelegate.fColor = appDelegate.akutsuBack
        appDelegate.colorIndex = 13
        let alertController = UIAlertController(title: "色登録", message: "色設定を【アクツ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 13
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    
    @IBAction func nothingum() {
        appDelegate.aColor = appDelegate.nottinghamWHITE
        appDelegate.bColor = appDelegate.nottinghamWINW
        appDelegate.cColor = appDelegate.nottinghamRED
        appDelegate.dColor = appDelegate.nottinghamPINK
        appDelegate.eColor = appDelegate.nottinghamBROWN
        appDelegate.fColor = appDelegate.nottinghamBack
        appDelegate.colorIndex = 14
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ノッティンガム】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 14
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    @IBAction func noa() {
        appDelegate.aColor = appDelegate.noaWHITE
        appDelegate.bColor = appDelegate.noaBLACK
        appDelegate.cColor = appDelegate.noaGREEN
        appDelegate.dColor = appDelegate.noaLIME
        appDelegate.eColor = appDelegate.noaYELLOW
        appDelegate.fColor = appDelegate.noaBack
        appDelegate.colorIndex = 15
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ノア】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 15
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    @IBAction func yurichika() {
        appDelegate.aColor = appDelegate.yurichikaRED
        appDelegate.bColor = appDelegate.yurichikaWHITE
        appDelegate.cColor = appDelegate.yurichikaYELLOW
        appDelegate.dColor = appDelegate.yurichikaGREEN
        appDelegate.eColor = appDelegate.yurichikaORANGE
        appDelegate.fColor = appDelegate.yurichikaBack
        appDelegate.colorIndex = 16
        let alertController = UIAlertController(title: "色登録", message: "色設定を【ユリチカ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 16
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    @IBAction func kaito() {
        appDelegate.aColor = appDelegate.kaitoSKY
        appDelegate.bColor = appDelegate.kaitoBLACK
        appDelegate.cColor = appDelegate.kaitoBLUE
        appDelegate.dColor = appDelegate.kaitoPURPLE
        appDelegate.eColor = appDelegate.kaitoVIORET
        appDelegate.fColor = appDelegate.kaitoBack
        appDelegate.colorIndex = 17
        let alertController = UIAlertController(title: "色登録", message: "色設定を【カイト】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 17
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    @IBAction func kaitoNAZO() {
        let alertController = UIAlertController(title: "WEBSITEhint", message: "https://swampman-is-alive.jimdo.com", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func oliver() {
        appDelegate.aColor = appDelegate.oliverWHITE
        appDelegate.bColor = appDelegate.oliverBLACK
        appDelegate.cColor = appDelegate.oliverPINK
        appDelegate.dColor = appDelegate.oliverGRAY
        appDelegate.eColor = appDelegate.oliverGREEN
        appDelegate.fColor = appDelegate.oliverBack
        appDelegate.colorIndex = 18
        let alertController = UIAlertController(title: "色登録", message: "色設定を【オリバー】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 18
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
    }
    @IBAction func ryuji() {
        appDelegate.aColor = appDelegate.ryujiWHITE
        appDelegate.bColor = appDelegate.ryujiBLACK
        appDelegate.cColor = appDelegate.ryujiBLUE
        appDelegate.dColor = appDelegate.ryujiGRAY
        appDelegate.eColor = appDelegate.ryujiYELLOW
        appDelegate.fColor = appDelegate.ryujiBack
        appDelegate.colorIndex = 19
        let alertController = UIAlertController(title: "色登録", message: "色設定を【リュウジ】で登録しました", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        appDelegate.colorIndex = 19
        colorData.set(appDelegate.colorIndex,forKey: "color")
        colorData.synchronize()
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
