//
//  WebServiceManager.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 1/5/16.
//  Copyright (c) 2016 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject {
    
    //Login dictionary keys
    static let emailKey = "email"
    static let passwordKey = "password"
    static let clientIdKey = "client_id"
    static let clientSecretKey = "client_secret"
    static let grantTypeKey = "grant_type"
    static let registrationIdKey = "registrationId"
    static let accessTokenKey = "access_token"
    static let tokenKey = "token"
    
    //Register dictionary keys
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let contactNumberKey = "contactNumber"
    
    //Guest Register dictionary keys
    static let plainPasswordFirstKey = "user_guest[plainPassword][first]"
    static let plainPasswordSecondKey = "user_guest[plainPassword][second]"
    static let referralCodeKey = "user_guest[referralCode]"
    
    //MARK: - Fire Login Request With URL
    class func fireLoginRequestWithUrl(url: String, emailAddress: String, password: String, actionHandler: (successful: Bool, responseObject: AnyObject, requestErrorType: RequestErrorType) -> Void) {
        let manager: APIManager = APIManager.sharedInstance
        
        let parameters: NSDictionary = [self.emailKey: emailAddress, self.passwordKey: password, self.clientIdKey: Constants.Credentials.clientID(), self.clientSecretKey: Constants.Credentials.clientSecret(), self.grantTypeKey: Constants.Credentials.grantBuyer]
        
        if Reachability.isConnectedToNetwork() {
            manager.POST(url, parameters: parameters, success: {
                (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
                 actionHandler(successful: true, responseObject: responseObject, requestErrorType: .NoError)
                }, failure: {
                    (task: NSURLSessionDataTask!, error: NSError!) in
                    if let task = task.response as? NSHTTPURLResponse {
                        if error.userInfo != nil {
                            actionHandler(successful: false, responseObject: error.userInfo!, requestErrorType: .ResponseError)
                        } else if task.statusCode == Constants.WebServiceStatusCode.pageNotFound {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .PageNotFound)
                        } else if task.statusCode == Constants.WebServiceStatusCode.requestTimeOut {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .RequestTimeOut)
                        } else {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .UnRecognizeError)
                        }
                    } else {
                        actionHandler(successful: false, responseObject: [], requestErrorType: .NoInternetConnection)            
                    }
            })
        } else {
            actionHandler(successful: false, responseObject: [], requestErrorType: .NoInternetConnection)
        }
    }
    
    //MARK: - Fire Register Request With URL
    class func fireRegisterRequestWithUrl(url: String, emailAddress: String, mobileNumber: String, password: String, firstName: String, lastName: String, actionHandler: (successful: Bool, responseObject: AnyObject, requestErrorType: RequestErrorType) -> Void) {
        let manager: APIManager = APIManager.sharedInstance
        
        let parameters: NSDictionary = [self.emailKey: emailAddress, self.passwordKey: password, self.firstNameKey: firstName, self.lastNameKey: lastName, self.contactNumberKey: mobileNumber]
        
        if Reachability.isConnectedToNetwork() {
            manager.POST(url, parameters: parameters, success: {
                (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
                actionHandler(successful: true, responseObject: responseObject, requestErrorType: .NoError)
                }, failure: {
                    (task: NSURLSessionDataTask!, error: NSError!) in
                    if let task = task.response as? NSHTTPURLResponse {
                        if error.userInfo != nil {
                            actionHandler(successful: false, responseObject: error.userInfo!, requestErrorType: .ResponseError)
                        } else if task.statusCode == Constants.WebServiceStatusCode.pageNotFound {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .PageNotFound)
                        } else if task.statusCode == Constants.WebServiceStatusCode.requestTimeOut {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .RequestTimeOut)
                        } else {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .UnRecognizeError)
                        }
                    } else {
                        actionHandler(successful: false, responseObject: [], requestErrorType: .NoInternetConnection)
                    }
            })
        } else {
            actionHandler(successful: false, responseObject: [], requestErrorType: .NoInternetConnection)
        }
    }
    
    //MARK: - Fire Guest Register Request With URL
    class func fireGuestRegisterRequestWithUrl(url: String, password: String, referralCode: String, actionHandler: (successful: Bool, responseObject: AnyObject, requestErrorType: RequestErrorType) -> Void) {
        let manager: APIManager = APIManager.sharedInstance
        
        let parameters: NSDictionary = [self.plainPasswordFirstKey: password, self.plainPasswordSecondKey: password, self.referralCodeKey: referralCode]
        
        if Reachability.isConnectedToNetwork() {
            manager.POST(url, parameters: parameters, success: {
                (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
                actionHandler(successful: true, responseObject: responseObject, requestErrorType: .NoError)
                }, failure: {
                    (task: NSURLSessionDataTask!, error: NSError!) in
                    if let task = task.response as? NSHTTPURLResponse {
                        if error.userInfo != nil {
                            actionHandler(successful: false, responseObject: error.userInfo!, requestErrorType: .ResponseError)
                        } else if task.statusCode == Constants.WebServiceStatusCode.pageNotFound {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .PageNotFound)
                        } else if task.statusCode == Constants.WebServiceStatusCode.requestTimeOut {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .RequestTimeOut)
                        } else {
                            actionHandler(successful: false, responseObject: [], requestErrorType: .UnRecognizeError)
                        }
                    } else {
                        actionHandler(successful: false, responseObject: [], requestErrorType: .NoInternetConnection)
                    }
            })
        } else {
            actionHandler(successful: false, responseObject: [], requestErrorType: .NoInternetConnection)
        }
    }
}