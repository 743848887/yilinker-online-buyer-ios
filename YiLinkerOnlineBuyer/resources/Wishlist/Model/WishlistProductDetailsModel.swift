//
//  ProductDetailsModel.swift
//  YiLinkerOnlineBuyer
//
//  Created by Rj Constantino on 8/7/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import Foundation

class WishlistProductDetailsModel {
    
    var id: String = ""
    var title: String = ""
    var slug: String = ""
    var image: String = ""
    var images: [ProductImagesModel] = []
    var shortDescription: String = ""
    var fullDescription: String = ""
    var sellerId: Int = 0
    
    var attributes: [ProductAttributeModel] = [] //done
    var productUnits: [ProductUnitsModel] = []
    
    var unitId: String = ""
    var itemId: Int = 0
    var quantity: Int = 0
    
    //DETAILS ???
    //BADGES  ???
    
    init(id: String, title: String, slug: String, image: String, images: NSArray, shortDescription: String, fullDescription: String, sellerId: Int, attributes: NSArray, productUnits: NSArray, unitId: String, itemId: Int, quantity: Int) {
        
        self.id = id
        self.title = title
        self.slug = slug
        self.image = image
        self.images = images as! [ProductImagesModel]
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
        self.sellerId = sellerId
        
        self.attributes = attributes as! [ProductAttributeModel]
        self.productUnits = productUnits as! [ProductUnitsModel]
        
        self.unitId = unitId
        self.itemId = itemId
        self.quantity = quantity
    }
    
    class func parseDataWithDictionary(dictionary: AnyObject) -> WishlistProductDetailsModel {
        
        var id: String = ""
        var title: String = ""
        var slug: String = ""
        var image: String = ""
        var images: [ProductImagesModel] = []
        var shortDescription: String = ""
        var fullDescription: String = ""
        var sellerId: Int = 0
        
        var attributes: [ProductAttributeModel] = [] //done
        var productUnits: [ProductUnitsModel] = []
        
        var unitId: String = ""
        var itemId: Int = 0
        var quantity: Int = 0
        
        //DETAILS ???
        //BADGES  ???
        
        // ----
        var combinations: [ProductAvailableAttributeCombinationModel] = []
        
        if dictionary.isKindOfClass(NSDictionary) {
            
            if let tempVar = dictionary["id"] as? String {
                id = tempVar
            }
            
            if let tempVar = dictionary["title"] as? String {
                title = tempVar
            }
            
            if let tempVar = dictionary["slug"] as? String {
                slug = tempVar
            }
            
            
            if let tempVar = dictionary["image"] as? String {
                image = tempVar
            }
            
            for tempVar in dictionary["images"] as! NSArray {
                let model: ProductImagesModel = ProductImagesModel.parseProductImagesModel(tempVar as! NSDictionary)
                images.append(model)
            }
            
            if let tempVar = dictionary["shortDescription"] as? String {
                shortDescription = tempVar
            }
            
            if let tempVar = dictionary["fullDescription"] as? String {
                fullDescription = tempVar
            }
            
            if let tempVar = dictionary["sellerId"] as? Int {
                sellerId = tempVar
            }
            
            for subValue in dictionary["attributes"] as! NSArray {
                let model: ProductAttributeModel = ProductAttributeModel.parseAttribute(subValue as! NSDictionary)
                attributes.append(model)
            }
            
            for subValue in dictionary["productUnits"] as! NSArray {
                let model: ProductUnitsModel = ProductUnitsModel.parseProductUnits(subValue as! NSDictionary)
                productUnits.append(model)
            }
            
            if let tempVar = dictionary["unitId"] as? String {
                unitId = tempVar
            }
            
            if let tempVar = dictionary["itemId"] as? Int {
                itemId = tempVar
            }
            
            if let tempVar = dictionary["quantity"] as? Int {
                quantity = tempVar
            }
            
            // data
        } // dictionary
        
        return WishlistProductDetailsModel(
            id: id,
            title: title,
            slug: slug,
            image: image,
            images: images,
            shortDescription: shortDescription,
            fullDescription: fullDescription,
            sellerId: sellerId,
            attributes: attributes,
            productUnits: productUnits,
            unitId: unitId,
            itemId: itemId,
            quantity: quantity)
        
        
    } // parseDataWithDictionary
    
}