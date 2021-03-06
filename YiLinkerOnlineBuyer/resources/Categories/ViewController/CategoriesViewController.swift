//
//  CategoriesViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 8/12/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, EmptyViewDelegate, UIWebViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var webView: UIWebView!

    var categoryModel: CategoryModel!
    var parentText: String = ""
    var firstLoad: Bool = true
    var categoryId: Int = 1
    
    var emptyView: EmptyView?
    var yiHud: YiHUD?
    var isFromFAB: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGrayColor()
        
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        
        configureNavigationBar()
        
        let nib = UINib(nibName: "CategoriesTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "CategoryIdentifier")

//        if firstLoad {
//            requestMainCategories()
//        }
//        loadWebView()
//        webView.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
        let webViewController: WebViewController = WebViewController(nibName: "WebViewController", bundle: nil)
        webViewController.webviewSource = WebviewSource.Category
        webViewController.isFromFab = self.isFromFAB
        self.navigationController!.pushViewController(webViewController, animated: false)
    }
    
    // MARK: - Methods
    
    func configureNavigationBar() {
        self.title = StringHelper.localizedStringWithKey("CATEGORIES_CS_LOCALIZE_KEY")
        
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
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func loadWebView() {
        if Reachability.isConnectedToNetwork() {
            showHUD()
            var url: String = APIEnvironment.baseUrl() + "/mobile-category"
            url = url.stringByReplacingOccurrencesOfString("api/", withString: "", options: nil, range: nil)
            println(url)
            webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
        } else {
            addEmptyView()
        }
    }
    
    // MARK: - Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.categoryModel != nil {
            return self.categoryModel.name.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CategoriesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CategoryIdentifier") as! CategoriesTableViewCell
        
        cell.selectionStyle = .None
        cell.categoryLabel.text = self.categoryModel!.name[indexPath.row]
        
        if self.categoryModel!.image.count != 0 {
            cell.setPicture(self.categoryModel!.image[indexPath.row])
        }
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return sectionHeaderView()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if Reachability.isConnectedToNetwork() {
            if categoryModel.hasChildren[indexPath.row] {
                let categories = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
                categories.firstLoad = false
                categories.parentText = categoryModel.name[indexPath.row]
                categories.requestCategories(parentId: categoryModel.id[indexPath.row])
                self.navigationController?.pushViewController(categories, animated: true)
            } else {
                gotoSearch(categoryModel.id[indexPath.row])
            }
        } else {
            self.tableView.hidden = true
            addEmptyView()
        }
    }
    
    // Methods
    
    func requestMainCategories() {
        if Reachability.isConnectedToNetwork() {
            requestCategories(parentId: categoryId)
        } else {
            addEmptyView()
        }
    }
    
    func sectionHeaderView() -> UIView {
        var containerView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 40))
        containerView.backgroundColor = .whiteColor()
        
        var categoryLabel = UILabel(frame: CGRectZero)
        categoryLabel.font = UIFont.boldSystemFontOfSize(15.0)
        categoryLabel.textColor = .darkGrayColor()
        categoryLabel.text = "    "
     
        if parentText == "" {
            categoryLabel.text! += StringHelper.localizedStringWithKey("SELECT_CATEGORY_LOCALIZE_KEY")
            categoryLabel.sizeToFit()
            categoryLabel.frame.size.height = containerView.frame.size.height
        } else {
            var tap = UITapGestureRecognizer()
            tap.numberOfTapsRequired = 1
            tap.addTarget(self, action: "gotoList:")
            containerView.addGestureRecognizer(tap)
            
            categoryLabel.text! += parentText
            categoryLabel.sizeToFit()
            categoryLabel.frame.size.height = containerView.frame.size.height
            
            var arrowImageView = UIImageView(frame: CGRectMake(categoryLabel.frame.size.width + 5, (categoryLabel.frame.size.height / 2) - (16 / 2), 10, 16))
            arrowImageView.image = UIImage(named: "right-gray")
            containerView.addSubview(arrowImageView)
        }
        
        var separatorView = UIView(frame: CGRectMake(0, containerView.frame.size.height - 1, containerView.frame.size.width, 1))
        separatorView.backgroundColor = .lightGrayColor()
        
        containerView.addSubview(categoryLabel)
        containerView.addSubview(separatorView)
        
        return containerView
    }
    
    func gotoList(gesture: UIGestureRecognizer) {
        gotoSearch(categoryId)
    }
    
    func gotoSearch(id: Int) {
        let resultList = ResultViewController(nibName: "ResultViewController", bundle: nil)
        resultList.passCategoryID(id)
        self.navigationController?.pushViewController(resultList, animated: true)
    }
    
    func addEmptyView() {
        if self.emptyView == nil {
            self.emptyView = UIView.loadFromNibNamed("EmptyView", bundle: nil) as? EmptyView
            self.emptyView!.delegate = self
            self.emptyView!.frame = self.view.bounds
            self.view.addSubview(self.emptyView!)
        } else {
            self.emptyView?.hidden = false
        }
    }
    
    func didTapReload() {
        self.emptyView?.hidden = true
        loadWebView()
//        if firstLoad {
//            requestMainCategories()
//        }
    }
    
    //MARK: -
    //MARK: - Show HUD
    func showHUD() {
        self.yiHud = YiHUD.initHud()
        self.yiHud!.showHUDToView(self.view)
    }
    
    // MARK: - Request
    
    func requestCategories(#parentId: Int) {
        showHUD()
        let manager = APIManager.sharedInstance
        
        manager.GET(APIAtlas.getCategories + String(parentId), parameters: nil, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            
            self.yiHud?.hide()
            self.categoryModel = CategoryModel.parseCategories(responseObject)
            
            if self.tableView != nil {
                self.tableView.hidden = false
                self.tableView.reloadData()
            }
        
            }, failure: {
                (task: NSURLSessionDataTask!, error: NSError!) in
                self.yiHud?.hide()
        })
    }

    // MARK: - Web View Delegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.yiHud?.hide()
    }
}
