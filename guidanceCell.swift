//
//  guidanceCell.swift
//  quizApp
//
//  Created by 東原与生 on 2017/04/23.
//  Copyright © 2017年 yoki. All rights reserved.
//

import UIKit

class guidanceCell: UITableViewCell {
    
    @IBOutlet weak var guidanceTitle: UILabel!
    @IBOutlet weak var guidanceDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
