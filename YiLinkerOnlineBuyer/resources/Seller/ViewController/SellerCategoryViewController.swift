//
//  SellerCategoryViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 9/10/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class SellerCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var categoryTableView: UITableView!
    
    var sellerCategory: SellerCategoryModel?
    var tableData: [SellerCategoryModel] = []
    
    var yiHud: YiHUD?
    var sellerId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.titleView()
        self.backButton()
        self.registerNib()
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        self.categoryTableView.separatorInset = UIEdgeInsetsZero
        self.categoryTableView.layoutMargins = UIEdgeInsetsZero
        self.categoryTableView.backgroundColor = UIColor.clearColor()
        self.categoryTableView.estimatedRowHeight = 112.0
        self.categoryTableView.rowHeight = UITableViewAutomaticDimension
        let footerView: UIView = UIView(frame: CGRectZero)
        self.categoryTableView.tableFooterView = footerView
        self.fireSellerCategory()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Customize navigation bar look
    func titleView() {
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, 100, 50))
        label.text = "Choose Category"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = label
    }
    
    func backButton() {
        var backButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        backButton.frame = CGRectMake(0, 0, 40, 40)
        backButton.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.setImage(UIImage(named: "back-white"), forState: UIControlState.Normal)
        var customBackButton:UIBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let navigationSpacer: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        navigationSpacer.width = -20
        
        self.navigationItem.leftBarButtonItems = [navigationSpacer, customBackButton]
    }
    
    func back() {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    //MARK: Register nib
    func registerNib() {
        let categoryNib: UINib = UINib(nibName: "SellerCategoryTableViewCell", bundle: nil)
        self.categoryTableView.registerNib(categoryNib, forCellReuseIdentifier: "SellerCategoryTableViewCell")
        
    }
    
    //MARK: Tableview delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !self.tableData.isEmpty {
            return self.tableData.count
        } else {
           return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let categoryTableViewCell: SellerCategoryTableViewCell = self.categoryTableView.dequeueReusableCellWithIdentifier("SellerCategoryTableViewCell") as! SellerCategoryTableViewCell
            if !self.tableData.isEmpty {
                categoryTableViewCell.categoryLabel.text = self.tableData[indexPath.row].categoryName
                categoryTableViewCell.categoryDescriptionLabel.text = self.tableData[indexPath.row].categorySubs
            }
            return categoryTableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {
            /*let resultViewController: ResultAllViewController = ResultAllViewController(nibName: "ResultAllViewController", bundle: nil)
            resultViewController.sellerId = self.sellerId
            println(self.sellerId)
            self.navigationController!.pushViewController(resultViewController, animated: true)*/
            let resultList = ResultViewController(nibName: "ResultViewController", bundle: nil)
            resultList.passSellerID("\(self.sellerId)")
            self.navigationController?.pushViewController(resultList, animated: true)
        } else {
            let sellerSubCategoryViewController: SellerSubCategoryViewController = SellerSubCategoryViewController(nibName: "SellerSubCategoryViewController", bundle: nil)
            sellerSubCategoryViewController.subCategoryName = self.tableData[indexPath.row].categorySubs2
            sellerSubCategoryViewController.categoryId = self.tableData[indexPath.row].categoryId2
            self.navigationController!.pushViewController(sellerSubCategoryViewController, animated: true)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       
        return 93
        
    }
    
    func fireSellerCategory() {
        self.showHUD()
        let manager = APIManager.sharedInstance
        //let parameters: NSDictionary = ["access_token" : SessionManager.accessToken()];
        println(APIAtlas.sellerCategory+"1")
        manager.GET(APIAtlas.sellerCategory+"\(self.sellerId)", parameters: nil, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            
            self.sellerCategory = SellerCategoryModel.parseDataFromDictionary(responseObject as! NSDictionary)
            var arr: [String] = []
            self.tableData.append(SellerCategoryModel(name: "All", categoryId: 0, subCategories: "This will display all seller's products.", subCategories2: arr))
            for var i: Int = 0; i < self.sellerCategory!.name.count; i++ {
                self.tableData.append(SellerCategoryModel(name: self.sellerCategory!.name[i],  categoryId: self.sellerCategory!.categoryId[i], subCategories: self.sellerCategory!.subCategories2[i], subCategories2: self.sellerCategory!.subCategories3[i]))
            }
            self.categoryTableView.reloadData()
            self.yiHud?.hide()
            }, failure: { (task: NSURLSessionDataTask!, error: NSError!) in
                println(error)
                self.yiHud?.hide()
        })

    }
    
    func showHUD() {
       self.yiHud = YiHUD.initHud()
       self.yiHud!.showHUDToView(self.view)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}