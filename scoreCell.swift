//
//  scoreCell.swift
//  quizApp
//
//  Created by 東原与生 on 2017/04/30.
//  Copyright © 2017年 yoki. All rights reserved.
//

import UIKit

class scoreCell: UITableViewCell {
    
    //スコア履歴用セルのタイトル・文言
    @IBOutlet var scoreDate: UILabel!
    @IBOutlet var scoreAmount: UILabel!
    @IBOutlet var scoreTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
