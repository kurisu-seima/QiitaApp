//
//  QiitaApiLoader.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/29.
//

import Foundation
import Alamofire

struct QiitaApiLoader {
    private init() {}
    static let shared = QiitaApiLoader()
    
    func fethArticles(handler: @escaping ([Qiita]) -> Void) {
        AF.request("https://qiita.com/api/v2/items").responseJSON { respons in
            do {
                guard let responseJsonData = try JSONSerialization.jsonObject(with: respons.data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String: Any]] else {
                    return
                }
                
                let qiitas = responseJsonData.map { dic -> Qiita in
                    return Qiita(dictionary: dic)
                }
                handler(qiitas)
            } catch {
                handler([])
                print("error in JSONSerialization", error.localizedDescription)
            }
        }
    }
}
