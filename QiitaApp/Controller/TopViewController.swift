//
//  TopViewController.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/24.
//

import UIKit
import Alamofire

class TopViewController: UIViewController {

    @IBOutlet weak var qiitaTableView: UITableView!

    var qiitas: [Qiita] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qiitaTableView.dataSource = self
        qiitaTableView.delegate = self
        
        request()
    }
    
    func request() {
        AF.request("https://qiita.com/api/v2/items").responseJSON { [self] respons in
            do {
                guard let responseJsonData = try JSONSerialization.jsonObject(with: respons.data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String: Any]] else {
                    return
                }
                
                for data in responseJsonData {
                    var qiita = Qiita()
                    qiita.title = (data["title"] as? String) ?? "No title"
                    qiita.likes_count = (data["likes_count"] as? Int) ?? 0
                    
                    if let user = data["user"] as? [String: Any] {
                        qiita.userName = user["name"] as? String ?? "No name"
                        qiita.profileImageURL = user["profile_image_url"] as? String ?? ""
                        qiita.websiteURL = user["website_url"] as? String ?? ""
                    }
                    qiitas.append(qiita)
                }
                qiitaTableView.reloadData()
            } catch {
                print("error in JSONSerialization", error.localizedDescription)
            }
        }
    }
}

extension TopViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        qiitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = qiitaTableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.setUp(qiitas: qiitas, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
}
