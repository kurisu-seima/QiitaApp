//
//  TopViewController.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/24.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var qiitaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qiitaTableView.dataSource = self
        qiitaTableView.delegate = self
    }
}

extension TopViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        QiitaManager.shared.Qiitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = qiitaTableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.setUp(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
}
