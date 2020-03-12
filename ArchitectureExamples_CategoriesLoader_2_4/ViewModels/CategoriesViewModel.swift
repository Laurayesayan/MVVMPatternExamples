//
//  CategoriesViewModel.swift
//  ArchitectureExamples_CategoriesLoader_2_4
//
//  Created by Лаура Есаян on 27.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

import Bond

import Alamofire

class CategoriesViewModel {
    public var categoriesList = MutableObservableArray<Categories>([])
    
    func loadCategories(url: String) {
        AF.request(url).responseJSON {
            response in
            if let json = response.value,
                let jsonDict = json as? NSDictionary {
                for (_, data) in jsonDict {
                    if let categories = Categories(data: data as! NSDictionary) {
                        self.categoriesList.append(categories)
                    }
                }
            }
        }
    }
    
}
