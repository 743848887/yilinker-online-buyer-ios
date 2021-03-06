//
//  CustomBarController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 8/12/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
 
    var isValidToSwitchToMenuTabBarItems: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        if let temp = self.tabBar.items as? [UITabBarItem] {
            let tabItems = self.tabBar.items as! [UITabBarItem]
            let tabItem0 = tabItems[0] as UITabBarItem
            let tabItem1 = tabItems[1] as UITabBarItem
            let tabItem2 = tabItems[2] as UITabBarItem
            let tabItem3 = tabItems[3] as UITabBarItem
            let tabItem4 = tabItems[4] as UITabBarItem
            
            tabItem3.title = StringHelper.localizedStringWithKey("WISHLISTTITLE_LOCALIZE_KEY")
            tabItem4.title = StringHelper.localizedStringWithKey("CART_TITLE_LOCALIZE_KEY")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
