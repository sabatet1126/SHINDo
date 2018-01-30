//
//  AppDelegate.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/01/10.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import NotificationCenter
import TwitterKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate ,UNUserNotificationCenterDelegate{
    var window: UIWindow?
    var charaNum:UserDefaults = UserDefaults.standard
    var colorData:UserDefaults = UserDefaults.standard
    var serifuData : UserDefaults = UserDefaults.standard
    var backgroundTaskID : UIBackgroundTaskIdentifier = 0
    
    var aColor = UIColor(red: 242/255, green: 241/255, blue: 237/255, alpha: 1.0)
    var bColor = UIColor(red: 147/255, green: 22/255, blue: 33/255, alpha: 1.0)
    var cColor = UIColor(red: 216/255, green: 201/255, blue: 115/255, alpha: 1.0)
    var dColor = UIColor(red: 3/255, green: 56/255, blue: 96/255, alpha: 1.0)
    var eColor = UIColor(red: 39/255, green: 48/255, blue: 67/255, alpha: 1.0)
    var fColor = UIColor(red: 226/255, green: 223/255, blue: 211/255, alpha: 1.0)
    
    var colorIndex = 0
    
    var textArray: [String] = ["終わった？", "無理しないでやって頂戴。", "集中して取り組みなさいよ","体調管理はしっかりしなさいよ。","休憩時間も必要ね","過度な労働はダメよ","進捗はどうかしら","作業はどうしたの？","休憩もほどほどに！","私も頑張るから..."]
    // UIColor(red: /255, green: /255, blue: /255, alpha: 1.0)
    
    let kyoutsuWHITE = UIColor(red: 242/255, green: 241/255, blue: 237/255, alpha: 1.0)
    
    let tsubakiRED = UIColor(red: 147/255, green: 22/255, blue: 33/255, alpha: 1.0)
    let tsubakiBROWN = UIColor(red: 216/255, green: 201/255, blue: 115/255, alpha: 1.0)
    let tsubakiBLUE =  UIColor(red: 3/255, green: 56/255, blue: 96/255, alpha: 1.0)
    let tsubakiBack = UIColor(red: 226/255, green: 223/255, blue: 211/255, alpha: 1.0)
    
    let tsubakiarray = ["終わった？", "無理しないでやって頂戴。", "集中して取り組みましょ。","体調管理は万全に！","休憩時間も必要ね","過度な労働はダメよ","進捗はどうかしら","作業はどうしたの？","休憩もほどほどに！","私も頑張るから..."]
    
    let utaBLACK = UIColor(red: 39/255, green: 48/255, blue: 67/255, alpha: 1.0)
    let utaGRAY = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0)
    let utaWHITE = UIColor(red: 239/255, green: 246/255, blue: 238/255, alpha: 1.0)
    let utaCOLORGRAY = UIColor(red: 156/255, green: 153/255, blue: 144/255, alpha: 1.0)
    let utaBROWN = UIColor(red: 106/255, green: 98/255, blue: 98/255, alpha: 1.0)
    let utaBack = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1.0)
    
    let utaarray = ["進捗どう？", "終わらせたらゲームしよ、ね。", "できることからさっさと仕上げる！","はぁ？まだ終わってないの？","口じゃなくて作業する手を動かしな","アンタ、やればできるんだからさ","ちゃっちゃかやっちゃおう","やってればいつかは終わるよ","期日だけは忘れんなよ","終わったらカラオケ行こう！"]
    
    let honokaPINK = UIColor(red: 250/255, green: 220/255, blue: 205/255, alpha: 1.0)
    let honokaVIORET = UIColor(red: 232/255, green: 215/255, blue: 255/255, alpha: 1.0)
    let honokaYELLOW = UIColor(red: 243/255, green: 255/255, blue: 225/255, alpha: 1.0)
    let honokaBLUE = UIColor(red: 199/255, green: 227/255, blue: 229/255, alpha: 1.0)
    let honokaBLACK = UIColor(red: 1/255, green: 22/255, blue: 56/255, alpha: 1.0)
    let honokaBack = UIColor(red: 159/255, green: 206/255, blue: 202/255, alpha: 1.0)
    let honokaarray = ["あらあら、困ったわねえ","まだ終わってないの？","進捗はどうかしら？","やりすぎはよくないわ、しっかり休んで","休憩も必要よ","あなたならできるはずよ","疲れたわねえ、ストレッチしましょ","無理は禁物よ","困ったわね、一緒に終わらせちゃいましょう","大丈夫、なんとかなるわ"]
    
    let veronicaGREEN = UIColor(red: 147/255, green: 183/255, blue: 190/255, alpha: 1.0)
    let veronicaBROWN = UIColor(red: 85/255, green: 67/255, blue: 72/255, alpha: 1.0)
    let veronicaBLUE = UIColor(red: 212/255, green: 245/255, blue: 245/255, alpha: 1.0)
    let veronicaGRAY = UIColor(red: 116/255, green: 117/255, blue: 120/255, alpha: 1.0)
    let veronicaBack = UIColor(red: 220/255, green: 237/255, blue: 235/255, alpha: 1.0)
    let veronicaarray = ["おわった？","わわ、予定たくさん...","進捗、どう？","はわわ、働きすぎ、ダメだよ","終わるまで、待ってるから","無理しすぎ、だめだよ！","終わった？","体壊すの、だめ、しっかり休んで","キミなら大丈夫、終わるよ！","準備だいじょぶ？作業しよう！"]
    
    let chandithYELLOW = UIColor(red: 225/255, green: 231/255, blue: 76/255, alpha: 1.0)
    let chandithRED = UIColor(red: 225/255, green: 89/255, blue: 100/255, alpha: 1.0)
    let chandithGREEN = UIColor(red: 107/255, green: 241/255, blue: 120/255, alpha: 1.0)
    let chandithblue = UIColor(red: 53/255, green: 167/255, blue: 225/255, alpha: 1.0)
    let chandithBack = UIColor(red: 237/255, green: 255/255, blue: 168/255, alpha: 1.0)
    
    let chanditharray = ["大丈夫大丈夫〜！","おわるおわるって〜！","君はできる子だよぉ！","へーきへーき、いける！","終わったん？","やってりゃおわるよ！","進捗どう？","無理しちゃだめだかんね","うおおー！終わらせるぞおー！","集中してガーっとやっちゃおう！"]
    
    let soniaWINE = UIColor(red: 85/255, green: 5/255, blue: 39/255, alpha: 1.0)
    let soniaRED = UIColor(red: 158/255, green: 43/255, blue: 37/255, alpha: 1.0)
    let soniaPINK = UIColor(red: 242/255, green: 84/255, blue: 91/255, alpha: 1.0)
    let soniaVIORET = UIColor(red: 169/255, green: 63/255, blue: 85/255, alpha: 1.0)
    let soniaBLACK = UIColor(red: 25/255, green: 50/255, blue: 60/255, alpha: 1.0)
    let soniaBack = UIColor(red: 244/255, green: 193/255, blue: 197/255, alpha: 1.0)
    
    let soniaarray = ["休んじゃおうよォ、やってばっかじゃ疲れるじゃん！","休憩休憩！楽しいことしよォ","いーじゃん、ちょっとぐらい休んでも許されるってェ","君は頑張ってるよ、休も休も！","進捗？んなもんなんとかなるなる！","楽しいことたくさんしちゃお〜","ゲームして、寝て、遊んじゃお！","ケセラセラ、なんとかなるなる〜","楽すんのは、楽しいよ〜","明日は明日の風が吹く！"]
    
    let hibariWHITE = UIColor(red: 251/255, green: 254/255, blue: 249/255, alpha: 1.0)
    let hibariRED = UIColor(red: 166/255, green: 52/255, blue: 70/255, alpha: 1.0)
    let hibariVIORET = UIColor(red: 126/255, green: 25/255, blue: 70/255, alpha: 1.0)
    let hibariBLUE = UIColor(red: 12/255, green: 98/255, blue: 145/255, alpha: 1.0)
    let hibariBLACK = UIColor(red: 0/255, green: 0/255, blue: 4/255, alpha: 1.0)
    let hibariBack = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    
    let hibariarray = ["アンタまだ終わってないの!?","終わらないなんて言ってる暇あったら、手を動かしなさい！","やってれば終わらない作業なんてないのよ。","やったら休む！休んだらやる！いいわね？","アンタ、体壊したら意味ないでしょう。休憩しなさい！","早く終わらして、周りの皆を驚かしてやりなさい！","アンタやりゃできるんだから。やってないだけね。","徹夜？徹夜しないでもできるスケジュールにしなさいよ。お肌の敵よ","疲れた？ストレッチでもしなさい。根詰めすぎると進むもんも進まなくなるわよ","はーああ、アンタって子はもう……"]
    
    
    let amenomiyaBLUE =  UIColor(red: 3/255, green: 56/255, blue: 96/255, alpha: 1.0)
    let amenomiyaRED = UIColor(red: 109/255, green: 107/255, blue: 106/255, alpha: 1.0)
    let amenomiyaBROWN = UIColor(red: 216/255, green: 201/255, blue: 115/255, alpha: 1.0)
    let amenomiyaBack = UIColor(red: 226/255, green: 223/255, blue: 211/255, alpha: 1.0)
    
    let amenomiyaarray = ["休息もまた力なり、ですよ。","無理は禁物です","進んでますか？","終わりました？","作業してください。","進捗の乱れは心の乱れ！","待っている人がたくさんいるんですよ！","進捗どうですか？","予定をコツコツこなしていきましょう。","継続は力なり！"]
    
    let soujiBLACK = UIColor(red: 19/255, green: 41/255, blue:61/255, alpha: 1.0)
    let soujiBLUE = UIColor(red: 0/255, green: 100/255, blue: 148/255, alpha: 1.0)
    let soujiGREEN = UIColor(red: 36/255, green: 123/255, blue: 160/255, alpha: 1.0)
    let soujiSKYBLUE = UIColor(red: 27/255, green: 152/255, blue: 224/255, alpha: 1.0)
    let soujiWHITE = UIColor(red: 232/255, green: 241/255, blue: 242/255, alpha: 1.0)
    let soujiBack = UIColor(red: 237/255, green: 251/255, blue: 255/255, alpha: 1.0)
    
    let soujiarray = ["こうなった以上仕方ない...やるぞ。","手を動かせ、終わらない作業なんてない。","休む選択もまあ、アリだ。","願ってるだけじゃ、作業は進まないぞ。","お前はやればできるんだから、ガーっとやっちまえ！","進捗はどうだ？","無理はするな、体調管理もタスクの一環だぞ。","よし、一緒にやろう。","こうやって急かすのも俺の仕事なんだ。","1ミリでも、進めばいい。"]
    
    let kotaroGREEN = UIColor(red: 180/255, green: 237/255, blue: 210/255, alpha: 1.0)
    let kotaroBLACK = UIColor(red: 11/255, green: 32/255, blue: 39/255, alpha: 1.0)
    let kotaroSKY = UIColor(red: 86/255, green: 142/255, blue: 163/255, alpha: 1.0)
    let kotaroTIFANY = UIColor(red: 129/255, green: 212/255, blue: 203/255, alpha: 1.0)
    let kotaroBLUE = UIColor(red: 64/255, green: 121/255, blue: 140/255, alpha: 1.0)
    let kotaroBack = UIColor(red: 199/255, green: 232/255, blue: 220/255, alpha: 1.0)
    
    let kotaroarray = ["や、やりましょ！ね！","えーと...進捗の方、どうですか...?","あーっと...えーっと...","む、無理のしすぎはだめですって！","す、すみません、でもこれも僕の仕事なので...","一緒に頑張りましょう、ね！","すいません、こんなことしかできなくて...","代わりにやりたい気持ちは山々なんですけど...ごめんなさい！","きみのためにも、僕のためにも、作業しちゃいましょ...！","あわわわ！ご、ごめんなさい！"]
    
    let minatoBLACK = UIColor(red: 22/255, green: 16/255, blue: 50/255, alpha: 1.0)
    let minatoWHITE = UIColor(red: 250/255, green: 255/255, blue: 129/255, alpha: 1.0)
    let minatoRED = UIColor(red: 246/255, green: 81/255, blue:29/255, alpha: 1.0)
    let minatoORANGE = UIColor(red: 224/255, green: 109/255, blue: 6/255, alpha: 1.0)
    let minatoYELLOW = UIColor(red: 225/255, green: 180/255, blue: 0/255, alpha: 1.0)
    let minatoBack = UIColor(red: 247/255, green: 206/255, blue: 207/255, alpha: 1.0)
    
    let minatoarray = ["うっそぉ？終わってないの？","やりたくないならやんなきゃいいじゃん。","終わらなくても俺知らないからね？","あっれ〜？この作業は進んでるのかな？あれ？","君の作業じゃん。君が困るだけだよ","進捗どーですか？","とりあえず終わらせられるように努力はしなよ","作業も大事だけど、休憩も大事ではあるよね","ちゃんと進んでる？","ふーん...頑張ってるならいいんだけどさあ？"]
    
    let issikiWHITE = UIColor(red: 246/255, green: 216/255, blue: 174/255, alpha: 1.0)
    let issikiBLUE = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
    let issikiPINK = UIColor(red: 218/255, green: 65/255, blue: 103/255, alpha: 1.0)
    let issikiVIORET = UIColor(red: 76/255, green: 44/255, blue: 105/255, alpha: 1.0)
    let issikiYELLOW = UIColor(red: 244/255, green: 211/255, blue: 94/255, alpha: 1.0)
    let issikiBack = UIColor(red: 234/255, green: 233/255, blue: 204/255, alpha: 1.0)
    
    let issikiarray = ["………。","……終わった？","……なるほどねぇ。","……働きすぎは、よくないと思うよ","……進捗、どう？","……進んでる、かな","……一緒に、なんとかしちゃおう","……終わらないのは、僕も、嫌だから……","……やってれば、きっと、終わると思うよ。","……そうだねぇ。"]
    
    let akutsuORANGE = UIColor(red: 241/255, green: 80/255, blue: 37/255, alpha: 1.0)
    let akutsuWHITE = UIColor(red: 230/255, green: 232/255, blue: 230/255, alpha: 1.0)
    let akutsuBLACK = UIColor(red: 38/255, green: 8/255, blue: 28/255, alpha: 1.0)
    let akutsuRED = UIColor(red: 122/255, green: 41/255, blue: 29/255, alpha: 1.0)
    let akutsuBack = UIColor(red: 239/255, green: 239/255, blue: 232/255, alpha: 1.0)
    
    let akutsuarray = ["あー、そうだなぁ……","進捗、どうだ。","やってりゃ終わらないことなんてないさ。","第一に、完成させること！細かいことにこだわるのは、その次だ。","一緒にやろうな、やってりゃ終わるさ","体を壊しちゃ元も子もないよ","無理しない程度にな","ささっと終わらしちまって、あとは休んじまおうぜ","あーあ、だるくもなるよなあ","俺だってこんなにアンタを急かしたくはないのさ。"]
    
    let nottinghamWINW = UIColor(red: 70/255, green: 18/255, blue: 32/255, alpha: 1.0)
    let nottinghamPINK = UIColor(red: 140/255, green: 47/255, blue: 57/255, alpha: 1.0)
    let nottinghamWHITE = UIColor(red: 248/255, green: 244/255, blue: 227/255, alpha: 1.0)
    let nottinghamBROWN = UIColor(red: 109/255, green: 61/255, blue: 20/255, alpha: 1.0)
    let nottinghamRED = UIColor(red: 85/255, green: 27/255, blue: 20/255, alpha: 1.0)
    let nottinghamBack = UIColor(red: 229/255, green: 221/255, blue: 218/255, alpha: 1.0)
    
    let nottinghamarray = ["それはいけませんねぇ……","進捗の方どうでしょうか？","諦めないでください、お手伝いいたしますから……！","お体にお気をつけて。頑張りすぎは毒でございます。","作業、進展の方は如何ですか？","私の頭でございますか？……予定が終わったら、考えましょう。","お仕事、ご苦労様です。","いやはや、たくさんのご予定がございますね……","一緒にやりましょう。やっていれば、終わりますよ。","嗚呼、どうかご無理だけはなさらないでください！"]
    
    
    let kaitoSKY = UIColor(red: 151/255, green: 223/255, blue: 252/255, alpha: 1.0)
    let kaitoBLUE = UIColor(red: 133/255, green: 138/255, blue: 227/255, alpha: 1.0)
    let kaitoPURPLE = UIColor(red: 97/255, green: 61/255, blue: 193/255, alpha: 1.0)
    let kaitoVIORET = UIColor(red: 78/255, green: 20/255, blue: 140/255, alpha: 1.0)
    let kaitoBLACK = UIColor(red: 44/255, green: 7/255, blue: 53/255, alpha: 1.0)
    let kaitoBack = UIColor(red: 218/255, green: 229/255, blue: 229/255, alpha: 1.0)
    
    let kaitoarray = ["捗っていますか...?","終わろうが終わるまいがワタシには関係ありませんがね...","働きすぎるようなら、休ませてあげましょうか...?ふひひっ","そのペースで...果たして終わるでしょうか?ひひっ","期限内に終わるよう努めてくださいねぇ","余計な仕事を増やさないでくださいねぇ?","このクスリはですねぇ...ふひひっ...終わらなかったら、飲ませてあげますよ","ここに作業の捗る薬が...副作用...?知りませんねぇ","終わっていない?ひひっ...ふひひ、ひーーーっゲホッゴホッ","進んでいないようですねぇ...お薬差し上げましょうか?"]
    
    let noaWHITE = UIColor(red: 247/255, green: 247/255, blue: 242/255, alpha: 1.0)
    let noaYELLOW = UIColor(red: 228/255, green: 230/255, blue: 195/255, alpha: 1.0)
    let noaGREEN = UIColor(red: 137/255, green: 152/255, blue: 120/255, alpha: 1.0)
    let noaLIME = UIColor(red: 49/255, green: 216/255, blue: 67/255, alpha: 1.0)
    let noaBLACK = UIColor(red: 22/255, green: 48/255, blue: 43/255, alpha: 1.0)
    let noaBack = UIColor(red: 180/255, green: 196/255, blue: 183/255, alpha: 1.0)
    
    let noaarray = ["作業は期日内に終わるものだと聞いています","作業というものはこんなに進まないものなんですね","今は何%終わっているんですか?","頑張りすぎは良くないと聞いています","適度な休憩を挟んでください","期日内に終わる可能性は...。言わないでおきますね","ご主人の体のメンテナンスは大丈夫なんですか?","大丈夫です、きっと終わりますよ。ソースはないんですけど...","何かお手伝いできることはありますか?","ノアもお手伝いします"]
    //"効率良く終わらせていきましょう"
    
    let yurichikaWHITE = UIColor(red: 187/255, green: 222/255, blue: 240/255, alpha: 1.0)
    let yurichikaYELLOW = UIColor(red: 233/255, green: 223/255, blue: 0/255, alpha: 1.0)
    let yurichikaGREEN = UIColor(red: 0/255, green: 166/255, blue: 166/255, alpha: 1.0)
    let yurichikaRED = UIColor(red: 217/255, green: 108/255, blue: 6/255, alpha: 1.0)
    let yurichikaORANGE = UIColor(red: 236/255, green: 117/255, blue: 5/255, alpha: 1.0)
    let yurichikaBack = UIColor(red: 255/255, green: 226/255, blue: 191/255, alpha: 1.0)
    
    let yurichikaarray = ["あれ?終わってないの。じゃ先休むね~","サボっちゃう?なんて、余裕ないかな","終わるの~?その調子で?","ちゃちゃっと終わらせちゃってよね~","働きすぎず、休みすぎずね~","ま、終わるんじゃない?締め切り 3 日後くらいには?","あたし遊んでくるから戻ってくるまでに終わらしといてね","いけるいけるって~ ...たぶん?","はやく終わらしちゃおうよ~","働きすぎは作業効率を下げるよ、知ってた?"]
    
    let oliverWHITE = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    let oliverGRAY = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
    let oliverGREEN = UIColor(red: 92/255, green: 158/255, blue: 173/255, alpha: 1.0)
    let oliverPINK = UIColor(red: 227/255, green: 151/255, blue: 116/255, alpha: 1.0)
    let oliverBLACK = UIColor(red: 50/255, green: 98/255, blue: 115/255, alpha: 1.0)
    let oliverBack = UIColor(red: 249/255, green: 167/255, blue: 154/255, alpha: 1.0)
    
    let oliverarray = ["終わりますよ!大丈夫!","進捗どうですか?","手を動かしてくださいよ、手を!","大丈夫ですよ、きっと大丈夫です!","作業、進んでます...?","きっと終わりますって!ははは!","ちゃんと終わるまで見てますからねっ","無理しすぎちゃダメですよ。","空いてる時間も有効に使いましょう!","一緒に頑張りましょ!"]
    
    let ryujiWHITE = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    let ryujiGRAY = UIColor(red: 141/255, green: 153/255, blue: 174/255, alpha: 1.0)
    let ryujiYELLOW = UIColor(red: 248/255, green: 243/255, blue: 43/255, alpha: 1.0)
    let ryujiBLUE = UIColor(red: 43/255, green: 45/255, blue: 66/255, alpha: 1.0)
    let ryujiBLACK = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    let ryujiBack = UIColor(red: 224/255, green: 224/255, blue: 219/255, alpha: 1.0)
    
    let ryujiarray = ["さっさと終わらしちまおうぜ!","仕事しすぎは毒だ、ってばーちゃんが言ってたぜ","へーきか?疲れてないか?","なんとかなるかじゃねえ、するんだよ","締め切りまでにはなんとかしようぜ...!!","ばーちゃんが、スケジュールは余裕もって決めな、って。","まず何から手をつけるべきなんだ...?","締切だけは!絶対破らないようにしような...!!","早め早めに終わらせて行けよ","終わったら一緒に煎餅でも食おうぜ~"]
    
    // ③ ナビゲーションバー上のアイテムの色
    
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        //        return Twitter.sharedInstance().application(app, open: url, options: options)
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //        Twitter.sharedInstance().start(withConsumerKey:"hTpkPVU4pThkM0", consumerSecret:"ovEqziMzLpUOF163Qg2mj")
        TWTRTwitter.sharedInstance().start(withConsumerKey:"NbHDnW641mkHFMC3CEWiBo0v5", consumerSecret:"fMidgUOsNZ1f1WgGKw7GvCQtB1L27kCotPGiXYst7r0HGBcNKl")
        
        
        
        
        
        UNUserNotificationCenter.current().delegate = self
        
        
        
        if charaNum.object(forKey: "Num") == nil {
            charaNum.set(0, forKey: "Num")
            
            if colorData.object(forKey: "Num") == nil {
                colorData.set(0, forKey: "Num")}
        }
        
        //      Twitter.sharedInstance().start(withConsumerKey:"NbHDnW641mkHFMC3CEWiBo0v5", consumerSecret:"fMidgUOsNZ1f1WgGKw7GvCQtB1L27kCotPGiXYst7r0HGBcNKl")
        
        
        if let notification = launchOptions?[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification,let userInfo = notification.userInfo{
            application.applicationIconBadgeNumber = 0
            application.cancelLocalNotification(notification)
        }
        //復帰に関係なくバッジが0じゃなければ0にする
        if application.applicationIconBadgeNumber != 0{
            application.applicationIconBadgeNumber = 0
        }
        
        
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            
            //2017/09/17 追記
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    debugPrint("通知許可")
                } else {
                    debugPrint("通知拒否")
                }
                
            })
            
            
            
        } else {
            // iOS 9
            //2017/09/17 追記
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("hoge")
    }
    
    
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        
        
        
        completionHandler([.alert,.sound,.badge])
    }
    
    //ポップアップ押した後に呼ばれる関数(↑の関数が呼ばれた後に呼ばれる)
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        UIApplication.shared.applicationIconBadgeNumber += 1
        
        //      let application = UIApplication()
        //     application.applicationIconBadgeNumber += 1
        
        //        //Alertダイアログでテスト表示
        //        let contentBody = response.notification.request.content.body
        //        let alert:UIAlertController = UIAlertController(title: "受け取りました", message: contentBody, preferredStyle: UIAlertControllerStyle.alert)
        //        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
        //            (action:UIAlertAction!) -> Void in
        //            print("Alert押されました")
        //        }))
        //        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        //        
        completionHandler()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        self.backgroundTaskID = application.beginBackgroundTask(){
            [weak self] in
            application.endBackgroundTask((self?.backgroundTaskID)!)
            self?.backgroundTaskID = UIBackgroundTaskInvalid
        }
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
    }
    
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        application.cancelAllLocalNotifications()
        
        var requestArr = [AnyObject?]()
        //セリフ実験
        var charaNum:UserDefaults = UserDefaults.standard
        
        
        
        var tsuuchi:String = ""
        var musicDate = MusicData()
        var tuchion:[String] = [String]()
        
        
        
        print(charaNum.object(forKey: "Num"))
        
        
        
        if charaNum.object(forKey: "Num") as! Int == 0 {
            tuchion = musicDate.tsubakiVoice[3]
            print(tuchion)
            tsuuchi = "進捗、どうなの？"
        }else if charaNum.object(forKey: "Num")as! Int == 1{
            tuchion = musicDate.utaVoice[3]
            tsuuchi = "進捗、どう？"
        }else if charaNum.object(forKey: "Num")as! Int == 2{
            tuchion = musicDate.tsutsumiVoice[3]
            tsuuchi = "進捗どうかしら〜？"
        }else if charaNum.object(forKey: "Num")as! Int == 3{
            tuchion = musicDate.veronicaVoice[3]
            tsuuchi = "...進捗、どう...？"
        }else if charaNum.object(forKey: "Num")as! Int == 4{
            tuchion = musicDate.chandithVoice[3]
            tsuuchi = "おーい！進捗！どう!?"
        }else if charaNum.object(forKey: "Num")as! Int == 5{
            tuchion = musicDate.soniaVoice[3]
            tsuuchi = "進捗どうかなー？"
        }else if charaNum.object(forKey: "Num")as! Int == 6{
            tuchion = musicDate.hibariVoice[3]
            tsuuchi = "アンタ進捗どうなってんの!?"
        }else if charaNum.object(forKey: "Num")as! Int == 7{
            tuchion = musicDate.amenomiyaVoice[3]
            tsuuchi = "進捗どうなんです？"
        }else if charaNum.object(forKey: "Num")as! Int == 8{
            tuchion = musicDate.soujiVoice[3]
            tsuuchi = "進捗どうだ？"
        }else if charaNum.object(forKey: "Num")as! Int == 9{
            tuchion = musicDate.kotaroVoice[3]
            tsuuchi = "しし、進捗、どうですかぁ...?"
        }else if charaNum.object(forKey: "Num")as! Int == 10{
            tuchion = musicDate.minatoVoice[3]
            tsuuchi = "進捗どう？終わった？"
        }else if charaNum.object(forKey: "Num")as! Int == 11{
            tuchion = musicDate.issikiVoice[3]
            tsuuchi = "...進捗、どう？"
        }else if charaNum.object(forKey: "Num")as! Int == 12{
            tuchion = musicDate.akutsuVoice[3]
            tsuuchi = "あー、進捗、どうだ？"
        }else if charaNum.object(forKey: "Num")as! Int == 13{
            tuchion = musicDate.notthinghamVoice[3]
            tsuuchi = "進捗の方如何でしょうか？"
        }else if charaNum.object(forKey: "Num")as! Int == 14{
            tuchion = musicDate.noaVoice[3]
            tsuuchi = "進捗の方どうですか？"
        }else if charaNum.object(forKey: "Num")as! Int == 15{
            tuchion = musicDate.yurichikaVoice[3]
            tsuuchi = "進捗だいじょぶー？"
        }else if charaNum.object(forKey: "Num")as! Int == 16{
            tuchion = musicDate.kaitoVoice[3]
            tsuuchi = "進捗、大丈夫ですか？"
        }else if charaNum.object(forKey: "Num")as! Int == 17{
            tuchion = musicDate.oliverVoice[3]
            tsuuchi = "進捗どうですか？"
        }else if charaNum.object(forKey: "Num")as! Int == 18{
            tuchion = musicDate.ryujiVoice[3]
            tsuuchi = "進捗大丈夫か？"
        }
        
        
        
        print(tuchion)
        
        if #available(iOS 10.0, *) {
            
            
            let now = Date()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd/HH/mm"
            
            let timeString = formatter.string(from: now)
            var badgeNum: Int = 0
            
            for i in 0..<todoItem.count {
                
                
                print(timeString)
                
                print(DateItem[i])
                
                
                if timeString < DateItem[i] {
                    
                    badgeNum += 1
                    
                    let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
                    
                    
                    let content = UNMutableNotificationContent()
                    content.title =  tsuuchi
                    content.body = todoItem[i]
                    content.userInfo = ["notifyID":todoItem[i]]
                    content.sound = UNNotificationSound.init(named: tuchion[0]+".mp3")
                    content.badge = badgeNum as NSNumber
                    DateItem[i] = DateItem[i].replacingOccurrences(of: ":", with: "/")//とりあえず置き換え
                    let split = DateItem[i].components(separatedBy: "/")
                    
                    
                    let date = DateComponents(year:Int(split[0]), month:Int(split[1]), day:Int(split[2]), hour:Int(split[3]), minute:Int(split[4]))
                    
                    print("hogehogehoge")
                    print(date)
                    
                    
                    let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
                    
                    
                    // id, content, trigger から UNNotificationRequest 作成
                    let request = UNNotificationRequest.init(identifier: todoItem[i], content: content, trigger: trigger)
                    
                    let center = UNUserNotificationCenter.current()
                    
                    center.delegate = self
                    
                    center.add(request as! UNNotificationRequest, withCompletionHandler: nil)
                    
                    //break
                    
                }
                
                
                
                
            }
            
            
            
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        //アプリがactive時に通知を発生させた時にも呼ばれる
        if application.applicationState != .active{
            //バッジを０にする
            application.applicationIconBadgeNumber = 0
            //通知領域から削除する
            application.cancelLocalNotification(notification)
        }else{
            //active時に通知が来たときはそのままバッジを0に戻す
            
            
            if application.applicationIconBadgeNumber != 0{
                application.applicationIconBadgeNumber = 0
                
                application.cancelLocalNotification(notification)
            }
        }
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        print("バックグラウンドからフォアグラウウンド")
        if application.applicationIconBadgeNumber != 0{
            application.applicationIconBadgeNumber = 0
            print("application\(application.applicationIconBadgeNumber)")
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
        
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        application.endBackgroundTask(self.backgroundTaskID)
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "saba.Todo" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "Todo", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    
    
}

