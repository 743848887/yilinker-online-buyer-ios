//
//  TotalSummaryPriceTableViewCell.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 11/21/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class TotalSummaryPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalPriceValueLabel: UILabel!
    @IBOutlet weak var shippingFeeValueLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.shippingFeeValueLabel.text = StringHelper.localizedStringWithKey("FREE_LOCALIZE_KEY")
        self.totalLabel.text = StringHelper.localizedStringWithKey("TOTAL_LOCALIZE_KEY")
        self.deliveryLabel.text = StringHelper.localizedStringWithKey("DELIVERY_LOCALIZE_KEY")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
