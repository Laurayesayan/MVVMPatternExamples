//
//  ViewController.swift
//  ArchitectureExamples_CategoriesLoader_2_4
//
//  Created by Лаура Есаян on 26.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var categoriesTableView: UITableView!
    let categoriesViewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCategoriesToTableView()
        categoriesViewModel.loadCategories(url: categoriesURL)
    }
    
    func bindCategoriesToTableView() {
        categoriesViewModel.categoriesList.bind(to: categoriesTableView) { (dataSource, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesTableViewCell
            
            cell.titleLabel.text = dataSource[indexPath.row].name
            
            var url = URL(string: "\(defaultStartAddress)\(dataSource[indexPath.row].iconImage)")
            
            // При отсутствии картинки вставялем дефолтную
            if dataSource[indexPath.row].iconImage.isEmpty {
                url = URL(string: defaultImageURL)
            }
            
            cell.categoriesImage.kf.setImage(with: url)
            
            return cell
        }.dispose(in: reactive.bag)
    }

}

