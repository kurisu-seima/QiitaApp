//
//  Qiita.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/24.
//

import Foundation

struct Qiita: Codable {
    
    var title: String
    var likes_count: Int
    var userName: String
    var profileImageURL: String
    var websiteURL: String
    
    init(dictionary: [String: Any]) {
        
        guard let user = dictionary["user"] as? [String: Any] else {
            abort()
        }
        
        title = dictionary["title"] as? String ?? ""
        likes_count = (dictionary["likes_count"] as? Int) ?? 0
        websiteURL = (dictionary["url"] as? String) ?? ""
        userName = user["name"] as? String ?? "No name"
        profileImageURL = user["profile_image_url"] as? String ?? ""
    }
}
