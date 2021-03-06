//
//  Toast.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 10/27/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class Toast: NSObject {
    class func displayToastWithMessage(message: String, duration: NSTimeInterval, view: UIView) {
        if count(message) > 1 {
            view.makeToast(message, duration: duration, position: CSToastPositionCenter, style: CSToastManager.sharedStyle())
        } else {
            view.makeToast(Constants.Localized.someThingWentWrong, duration: duration, position: CSToastPositionCenter, style: CSToastManager.sharedStyle())
        }
    }
    
    class func displayToastWithMessage(message: String, view: UIView) {
        view.makeToast(message, duration: 1.5, position: CSToastPositionCenter, style: CSToastManager.sharedStyle())
    }
}
