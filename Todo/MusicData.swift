//
//  MusicData.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/05/30.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit

class MusicData: NSObject {
    
//4
    //var だれか=[完了ボイス、プラス、マイナス、通知]
    
//つばき
    var tsubakiVoice:[[String]] = [["tb11","tb12","tb13","tb14"],["tb01","tb13","tb17","tb02","tb05","tb06","tb10"],["tb08","tb07","tb09","tb03","tb04",],["tb07"],["tb01","tb13","tb17","tb02","tb05","tb06","tb10","tb08","tb07","tb09","tb03","tb04","tb16","tb18","tb19"]]
//うた
    var utaVoice:[[String]] =  [["u12","u13","u15","u14"],["u02","u06","u07","u08","u09","u10","u01"],["u11","u03","u04","u05","u18",],["u01"],["u02","u06","u07","u08","u09","u10","u01","u11","u03","u04","u05","u18","u16","u17","u19"]]
//つつみ
    var tsutsumiVoice:[[String]] =  [["tutumi012","tutumi013","tutumi014","tutumi015"],["tutumi004","tutumi005","tutumi006","tutumi007","tutumi008","tutumi009","tutumi002"],["tutumi001","tutumi002","tutumi003","tutumi010","tutumi011"],["tutumi003"],["tutumi004","tutumi005","tutumi006","tutumi007","tutumi008","tutumi009","tutumi002","tutumi001","tutumi002","tutumi003","tutumi010","tutumi011","tutumi016","tutumi017","tutumi018","tutumi019"]]
//ヴェロニカ
    var veronicaVoice:[[String]] =  [["ve12","ve13","ve14","ve15"],["ve07","ve09","ve10","ve11","ve12","ve02","ve04-2"],["ve01","ve06","ve08","ve00","ve05"]
        ,["ve00"],["ve07","ve09","ve10","ve11","ve12","ve02","ve04-2","ve01","ve06","ve08","ve00","ve05","ve02","ve03","ve04-a"]]
//キャンディス
    var chandithVoice:[[String]] =  [["ca12","ca13","ca14","ca15"],["ca01","ca02","ca03","ca04","ca06","ca07","ca08"],["ca20","ca05","ca10","ca09","ca18"],["ca07"],["ca01","ca02","ca03","ca04","ca06","ca07","ca08","ca20","ca05","ca10","ca09","ca18","ca16","ca17","ca19"]]
//ソニア
    var soniaVoice:[[String]] =  [["SNA-01","SNA-02","SNA-10","SNA-11"],["SNA-04","SNA-07","SNA-06","SNA-13","SNA-14","SNA-15","SNA-16"],["SNA-17","SNA-18","SNA-20","SNA-09","SNA-05"],["SNA-19"],["SNA-04","SNA-07","SNA-06","SNA-13","SNA-14","SNA-15","SNA-16","SNA-17","SNA-18","SNA-20","SNA-09","SNA-05","SNA-03","SNA-08"]]
//ヒバリ
    var hibariVoice:[[String]] =  [["HBR-06","HBR-09","HBR-11","HBR-18"],["HBR-03","HBR-07","HBR-08","HBR-10","HBR-13","HBR-17","HBR-16"],["HBR-12","HBR-15","HBR-19","HBR-01","HBR-02"],["HBR-20"],["HBR-03","HBR-07","HBR-08","HBR-10","HBR-13","HBR-17","HBR-16","HBR-12","HBR-15","HBR-19","HBR-01","HBR-02","HBR-04","HBR-05"]]
//アメノミヤ
    var amenomiyaVoice:[[String]] =  [["am-02","am-03","am-04","am-11"],["am-08","am-09","am-13","am-15","am-17","am-19","am-05"],["am-10","am-12","am-14","am-16","am-18"],["am-19"],["am-08","am-09","am-13","am-15","am-17","am-19","am-05","am-10","am-12","am-14","am-16","am-18","am-01","am-06","am-07"]]
//ソウジ
    var soujiVoice:[[String]] =  [["souji12","souji13","souji14","souji15"],["souji4","souji6","souji7","souji8","souji9","souji11","souji19"],["souji2","souji3","souji5","souji10","souji20"],["souji1"],["souji2","souji3","souji5","souji10","souji20","souji4","souji6","souji7","souji8","souji9","souji11","souji19","souji18","souji17"]]
//コタロー
    var kotaroVoice:[[String]] =  [["ko11","ko12","ko13","ko14"],["ko01","ko04","ko05","ko06","ko08","ko09","ko11"],["ko07","ko10","ko02","ko18","ko03"],["ko02"],["ko01","ko04","ko05","ko06","ko08","ko09","ko11","ko07","ko10","ko02","ko18","ko03","ko16","ko17","ko18","ko19"]]
   
//ミナト
    var minatoVoice:[[String]] =  [["12A","13B","14A","15B"],["1A","4A","5B","7A","8B","9C","10B","16A"],["6D","19D","18B","3B","2A"],["6B"],["1A","4A","5B","7A","8B","9C","10B","16A","6D","19D","18B","3B","2A","17A"]]
//イッシキ
    var issikiVoice:[[String]] =  [["ISK-16","ISK-17","ISK-18","ISK-19"],["ISK-02","ISK-06","ISK-10","ISK-11","ISK-14","ISK-15","ISK-03"],["ISK-05","ISK-07","ISK-09","ISK-12","ISK-13"],["ISK-07"],["ISK-02","ISK-06","ISK-10","ISK-11","ISK-14","ISK-15","ISK-03","ISK-05","ISK-08","ISK-09","ISK-12","ISK-13","ISK-01","ISK-03","ISK-04","ISK-07"]]
//アクツ
    var akutsuVoice:[[String]] =  [["ak14","ak15","ak12-2","ak13"],["ak02","ak01","ak05","ak06","ak07","ak08","ak09"],["ak03","ak10","ak11","ak04","ak19"],["ak02"],["ak02","ak01","ak05","ak06","ak07","ak08","ak09","ak03","ak10","ak11","ak04","ak19","ak17","ak18","ak20"]]
//のってぃんがむ
    var notthinghamVoice:[[String]] =  [["ntg-12","ntg-13","ntg-14","ntg-15"],["ntg-04","ntg-05","ntg-06","ntg-07","ntg-08","ntg-11","ntg-01"],["ntg-02","ntg-03","ntg-10","ntg-20","ntg-18"],["ntg-01"],["ntg-19","ntg-17","ntg-04","ntg-05","ntg-06","ntg-07","ntg-08","ntg-11","ntg-01","ntg-02","ntg-03","ntg-10","ntg-20","ntg-18"]]
//ノア
    var noaVoice:[[String]] =  [["n_12","n_13","n_14","n_15"],["n_19","n_04","n_05","n_07","n_08","n_11","n_10"],["n_01","n_02","n_06","n_09_A","n_03"],["n_03"],["n_19","n_04","n_05","n_07","n_08","n_11","n_10","n_01","n_02","n_06","n_09_A","n_03","n_16","n_17","n_18"]]
//ユリチカ
    var yurichikaVoice:[[String]] =  [["Y12","Y13","Y14","Y15"],["Y2","Y4","Y5","Y10","Y7","Y8","Y9"],["Y1","Y3","Y6","Y11","Y19"],["Y4"],["Y2","Y4","Y5","Y10","Y7","Y8","Y9","Y1","Y3","Y6","Y11","Y19","Y16","Y17","Y18"]]
//カイト
    var kaitoVoice:[[String]] =  [["B12","B13","B14","B15"],["B2","B4","B6","B8","B9","B11","B10"],["B1","B3","B5","B7","B10"],["B1"],["B2","B4","B6","B8","B9","B11","B10","B1","B3","B5","B7","B10","B16b","B17b","B18a","B19c"]]
//オリバー
    var oliverVoice:[[String]] =  [["o_12","o_13","o_14","o_15",],["o_01","o_02","o_05","o_07","o_09","o_11","o_17",],["o_03","o_04","o_06","o_08","o_10",],["o_03",],["o_01","o_02","o_05","o_07","o_09","o_11","o_17","o_03","o_04","o_06","o_08","o_10","o_16","o_18","o_19"]]
//リュウジ
    var ryujiVoice:[[String]] =  [["k12","k13","k14","k15B",],["k3","k2A","k5B","k6B","k7","k10","k11",],["k1","k4B","k8","k18B","k9A"],["k9B",],["k3","k2A","k5B","k6B","k7","k10","k11","k1","k4B","k8","k18B","k9A","k16","k17","k18B","k19"]]

    

}
