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
    
    var qiitas: [Qiita] = [Qiita(title: "早く転職したい", likes_count: 10, userName: "seima", profileImageURL: nil, websiteURL: nil)]
    
//    var qiitaData: [[String: Any]] = [] {
//        didSet {
//            qiitaTableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qiitaTableView.dataSource = self
        qiitaTableView.delegate = self
        
//        request()
    }
    
//    func request() {
    //        AF.request("https://qiita.com/api/v2/items").responseJSON {_ in
//            [self] respons in
//            let responsDataArray = try! JSONSerialization.jsonObject(with: respons.data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any]
//            let responsData = responsDataArray.map { (data) -> [String: Any] in
//                return data as! [String: Any]
//            }
//            qiitaData = responsData
//        }
//    }
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


