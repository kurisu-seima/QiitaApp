//
//  CustomTableViewCell.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/24.
//

import UIKit
import AlamofireImage

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
    
    func setUp(qiitas: [Qiita], index: Int) {
        articleTitle.text = qiitas[index].title
        likesCount.text = "ライク数：\(String(qiitas[index].likes_count))"
        if qiitas[index].userName == "" {
            userName.text = "No name"
        } else {
            userName.text = qiitas[index].userName
        }

        if let profileURL = URL(string: qiitas[index].profileImageURL) {
            userProfileImage.af.setImage(withURL: profileURL, placeholderImage:UIImage(named: "No Image Icon"))
        }
    }
}
