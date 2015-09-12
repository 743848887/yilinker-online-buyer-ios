//
//  TransactionDetailsModel.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 9/9/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class TransactionDetailsModel: NSObject {
   
    /*
    "sellerId": 1,
    "sellerStore": "easyshops",
    "sellerContactNumber": "09176060821",
    "hasFeedback": false,
    "products": [
    {
    "orderProductId": "1",
    "productId": "24",
    "quantity": 1,
    "unitPrice": "1000.0000",
    "totalPrice": "1000.0000",
    "productName": "Sample Product 24",
    "handlingFee": "0.0000",
    "dateAdded": {
    "date": "2015-08-22 01:32:09.000000",
    "timezone_type": 3,
    "timezone": "Asia/Manila"
    },
    "lastDateModified": {
    "date": "2015-08-22 01:32:09.000000",
    "timezone_type": 3,
    "timezone": "Asia/Manila"
    },
    "orderProductStatus": {
    "orderProductStatusId": 1,
    "name": "Payment Confirmed",
    "description": "Payment made via valid payment gateway"
    },
    "productImage": "http://online.api.easydeal.ph/assets/images/uploads/products/?"
    }


    */
    var isSuccessful: Bool = false
    var sellerId: [Int] = []
    var sellerId2: [Int] = []
    var sellerStore: [String] = []
    var sellerContactNumber: [String] = []
    var hasFeedback: [Bool] = []
    var orderProductId: [String] = []
    var productId: [String] = []
    var quantity: [Int] = []
    var unitPrice: [String] = []
    var totalPrice: [String] = []
    var productName: [String] = []
    var handlingFee: [String] = []
    var orderProductStatusId: [Bool] = []
    var name: [String] = []
    var productDescription: [String] = []
    var productImage: [String] = []
    
    var sellerName: String = ""
    var sellerContact: String = ""
    var id: Int = 0
    var sellerIdForFeedback: Int = 0
    var feedback: Bool = false
    var transactions: [TransactionDetailsProductsModel] = []
    
    init(sellerName: String, sellerContact: String, id: Int, sellerIdForFeedback: Int, feedback: Bool, transactions: [TransactionDetailsProductsModel]) {
        self.sellerName = sellerName
        self.sellerContact = sellerContact
        self.id = id
        self.sellerIdForFeedback = sellerIdForFeedback
        self.feedback = feedback
        self.transactions = transactions
    }
    
    init(isSuccessful: Bool, sellerId: NSArray, sellerId2: NSArray, sellerStore: NSArray, sellerContactNumber: NSArray, hasFeedback: NSArray, orderProductId: NSArray, productId: NSArray, quantity: NSArray, unitPrice: NSArray, totalPrice: NSArray, productName: NSArray, handlingFee: NSArray, orderProductStatusId: NSArray, name: NSArray, productDescription: NSArray, productImage: NSArray){
        
        self.sellerId = sellerId as! [Int]
        self.sellerId2 = sellerId2 as! [Int]
        self.sellerStore = sellerStore as! [String]
        self.sellerContactNumber = sellerContactNumber as! [String]
        self.hasFeedback = hasFeedback as! [Bool]
        self.isSuccessful = isSuccessful as Bool
        self.orderProductId = orderProductId as! [String]
        self.productId = productId as! [String]
        self.quantity = quantity as! [Int]
        self.unitPrice = unitPrice as! [String]
        self.totalPrice = totalPrice as! [String]
        self.productName = productName as! [String]
        self.handlingFee = handlingFee as! [String]
        self.orderProductStatusId = orderProductStatusId as! [Bool]
        self.name = name as! [String]
        self.productDescription = productDescription as! [String]
        self.productImage = productImage as! [String]
        
    }
    
    class func parseDataFromDictionary(dictionary: AnyObject) -> TransactionDetailsModel {
        var sellerId: [Int] = []
        var sellerId2: [Int] = []
        var sellerStore: [String] = []
        var sellerContactNumber: [String] = []
        var hasFeedback: [Bool] = []
        var isSuccessful: Bool = false
        var orderProductId: [String] = []
        var productId: [String] = []
        var quantity: [Int] = []
        var unitPrice: [String] = []
        var totalPrice: [String] = []
        var productName: [String] = []
        var handlingFee: [String] = []
        var orderProductStatusId: [Bool] = []
        var name: [String] = []
        var productDescription: [String] = []
        var productImage: [String] = []
        
        if dictionary.isKindOfClass(NSDictionary) {
       
            if let tempVar = dictionary["isSuccessful"] as? Bool {
                isSuccessful = tempVar
            }
            
            if let value: AnyObject = dictionary["data"] {
                let transactions: NSArray = value["transactionItems"] as! NSArray
                for transaction in transactions as! [NSDictionary] {
                    
                    sellerId.append(transaction["sellerId"] as! Int)
                    sellerStore.append(transaction["sellerStore"] as! String)
                    sellerContactNumber.append(transaction["sellerContactNumber"] as! String)
                    hasFeedback.append(transaction["hasFeedback"] as! Bool)
                    
                    let products: NSArray = transaction["products"] as! NSArray
                    for product in products as! [NSDictionary] {
                        orderProductId.append(product["orderProductId"] as! String)
                        productId.append(product["productId"] as! String)
                        quantity.append(product["quantity"] as! Int)
                        unitPrice.append(product["unitPrice"] as! String)
                        totalPrice.append(product["totalPrice"] as! String)
                        productName.append(product["productName"] as! String)
                        handlingFee.append(product["handlingFee"] as! String)
                        sellerId2.append(transaction["sellerId"] as! Int)
                        if let orderProductStatus: AnyObject = product["orderProductStatus"] {
                            orderProductStatusId.append(orderProductStatus["orderProductStatusId"] as! Bool)
                            name.append(orderProductStatus["name"] as! String)
                            productDescription.append(orderProductStatus["description"] as! String)
                        }
                        
                        productImage.append(product["productImage"] as! String)
                    }
                }
            }
        }
        
        let transactionDetailsModel = TransactionDetailsModel(isSuccessful: isSuccessful, sellerId: sellerId, sellerId2: sellerId2, sellerStore: sellerStore, sellerContactNumber: sellerContactNumber, hasFeedback: hasFeedback, orderProductId: orderProductId, productId: productId, quantity: quantity, unitPrice: unitPrice, totalPrice: totalPrice, productName: productName, handlingFee: handlingFee, orderProductStatusId: orderProductStatusId, name: name, productDescription: productDescription, productImage: productImage)
        
        return transactionDetailsModel
    }

}