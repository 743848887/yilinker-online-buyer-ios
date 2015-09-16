//
//  TransactionCancelOrderView.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 9/15/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class TransactionCancelOrderView: UIView {

    @IBOutlet weak var cancelView: DynamicRoundedView!
    
    override func awakeFromNib() {
        
        var tap = UITapGestureRecognizer(target: self, action: "cancelOrder:")
        cancelView.addGestureRecognizer(tap)
        
    }
    
    func cancelOrder(sender: AnyObject){
        println("cancel order")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
