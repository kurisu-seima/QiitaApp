//
//  QiitaManager.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/24.
//

import Foundation

class QiitaManager {
    
    static let shared: QiitaManager = QiitaManager()
    
    private init() {}
    
    private (set) var Qiitas: [Qiita] = [Qiita(title: "私は早くエンジニアになりたい", likes_count: 1000, userName: "クリス・セイマ", profileImageURL: "", websiteURL: "")]
    
}
