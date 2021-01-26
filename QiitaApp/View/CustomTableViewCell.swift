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
        likesCount.text = String(qiitas[index].likes_count!)
        userName.text = qiitas[index].userName
//        articleTitle.text = (qiitaData[index]["title"] as! String)
//        let user = qiitaData[index]["user"] as! [String: Any]
//        userName.text = (user["name"] as! String)
//        likesCount.text = "ライク数：\(String((qiitaData[index]["likes_count"] as! Int)))"
//        self.userProfileImage.af.setImage(withURL: user["profile_image_url"] as! URL)
    }
}
