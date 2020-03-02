//
//  ToDoTableViewCell.swift
//  ArchitectureExamples_CategoriesLoader_2_4
//
//  Created by Лаура Есаян on 29.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
