//
//  SellerSubCategoryModel.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 9/30/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class SellerSubCategoryModel: NSObject {
   
    var name: [String] = []
    var categoryId: [Int] = []
    
    init(name: NSArray, categoryId: NSArray) {
        self.name = name as! [String]
        self.categoryId = categoryId as! [Int]
    }
    
    class func parseDataFromDictionary(dictionary: AnyObject) -> SellerSubCategoryModel {
    
        var name: [String] = []
        var category: [Int] = []
        
        if dictionary.isKindOfClass(NSDictionary) {
            
            if let val: AnyObject = dictionary["name"] {
                if let categoryName = dictionary["name"] as? String {
                    name.append(categoryName)
                }
            }
            if let val: AnyObject = dictionary["categoryId"] {
                if let categoryId = dictionary["categoryId"] as? Int {
                    category.append(categoryId)
                }
            }
        }
        
        let sellerSubCategoryModel = SellerSubCategoryModel(name: name, categoryId: category)
        return sellerSubCategoryModel
    }
}
