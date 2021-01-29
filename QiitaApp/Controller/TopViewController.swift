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
        
        fethArticles()
    }
    
    func fethArticles() {
        
        QiitaApiLoader.shared.fethArticles { qiitas in
            self.qiitas = qiitas
            self.qiitaTableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebViewController
        nextVC.urlString = qiitas[indexPath.row].websiteURL
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
