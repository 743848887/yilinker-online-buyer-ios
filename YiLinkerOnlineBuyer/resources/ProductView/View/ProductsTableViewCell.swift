//
//  ProductsTableViewCell.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 8/17/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

protocol ProductsTableViewCellDelegate {
    func productstableViewCellDidTapProductWithTarget(target: String, type: String, productId: String)
    func productstableViewCellDidTapMoreProductWithTarget(target: String)
}

class ProductsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var moreSellersProduct: DynamicRoundedButton!
    
    var productModels:[HomePageProductModel] = [HomePageProductModel]()
    var delegate: ProductsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Register nib
        self.regsterNib()
    }
    
    //MARK: Register nib class for collectionview cell
    func regsterNib() {
        let cellNib: UINib = UINib(nibName: "FullImageCollectionViewCell", bundle: nil)
        self.collectionView.registerNib(cellNib, forCellWithReuseIdentifier: "FullImageCollectionViewCell")
        self.collectionView.backgroundColor = UIColor.clearColor()
        self.collectionView.reloadData()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Collectionview delegate methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productModels.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: FullImageCollectionViewCell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("FullImageCollectionViewCell", forIndexPath: indexPath) as! FullImageCollectionViewCell
        
        if indexPath.row < self.productModels.count {
            let homeProductModel: ProductModel = self.productModels[indexPath.row]
            cell.itemProductImageView.sd_setImageWithURL(homeProductModel.imageURL, placeholderImage: UIImage(named: "dummy-placeholder"))
        }
        
        cell.itemProductImageView.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if self.productModels.count > indexPath.row {
            let productModel: HomePageProductModel = self.productModels[indexPath.row]
            self.delegate?.productstableViewCellDidTapProductWithTarget(productModel.target, type: productModel.targetType, productId: productModel.productId)
        }
    }
    
    @IBAction func moreSellerProduct(sender: AnyObject) {
        self.delegate?.productstableViewCellDidTapMoreProductWithTarget("more")
    }
}
