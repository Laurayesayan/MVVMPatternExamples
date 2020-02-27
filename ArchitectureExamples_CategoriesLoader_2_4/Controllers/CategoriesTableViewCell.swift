//
//  CategoriesTableViewCell.swift
//  ArchitectureExamples_CategoriesLoader_2_4
//
//  Created by Лаура Есаян on 27.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoriesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
