//
//  CustomTableViewCell.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(index: Int) {
        articleTitle.text = QiitaManager.shared.Qiitas[index].title
        userName.text = QiitaManager.shared.Qiitas[index].userName
        likesCount.text = "ライク数：\(String(QiitaManager.shared.Qiitas[index].likes_count!))"
    }
}
