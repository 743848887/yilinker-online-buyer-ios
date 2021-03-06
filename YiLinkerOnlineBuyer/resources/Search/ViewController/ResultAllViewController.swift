//
//  ResultAllViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 12/12/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class ResultAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource, FilterViewControllerDelegate {
    
    let manager = APIManager.sharedInstance
    
    let grid:String = "GRID"
    let list:String = "LIST"
    let seller:String = "SELLER"
    
    let reuseIdentifierGrid: String = "ProductResultGridCollectionViewCell"
    let reuseIdentifierList: String = "ProductResultListCollectionViewCell"
    let reuseIdentifierSeller: String = "SellerResultCollectionViewCell"
    var type: String = "GRID"
    
    //Variable for determining what kind of result will be shown
    var targetType: TargetType?
    
    @IBOutlet weak var noResultLabel: UILabel!
    @IBOutlet weak var sortPickerTableView: UITableView!
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    @IBOutlet weak var sortView: UIView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var viewTypeView: UIView!
    @IBOutlet weak var viewTypeImageView: UIImageView!
    
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var viewTypeLabel: UILabel!
    @IBOutlet weak var actionView: UIView!
    
    @IBOutlet weak var actionViewHeight: NSLayoutConstraint!
    var collectionViewData: [SearchResultModel] = []
    var sellerCollectionViewData: [SearchSellerModel] = []
    var sortData: [String] = []
    var sortParameter: [String] =
    [ "sortType=BYDATE&sortDirection=ASC"
        ,"sortType=BYDATE&sortDirection=DESC"
        ,"sortType=ALPHABETICAL&sortDirection=ASC"
        ,"sortType=ALPHABETICAL&sortDirection=DESC"]
    
    var filterAtributes: [FilterAttributeModel] = []
    
    typealias InitialSearchParameters = (targetUrl: String, parameters: NSDictionary!)
    var initialParameters: InitialSearchParameters? = nil
    
    var searchSuggestion: SearchSuggestionModel!
    
    var fullDimView: UIView?
    
    var yiHud: YiHUD?
    
    var totalResultCount: Int = -1
    
    var page:Int = 0
    
    var requestSuggestionSearchUrl: String = ""
    var maxPrice: Double = 0
    var minPrice: Double = 0
    var selectedMaxPrice: Double = 0
    var selectedMinPrice: Double = 0
    
    var listLocalizeString: String = ""
    var gridMessageLocalizeString: String = ""
    
    var categoryName: String = ""
    var categoryId: String = ""
    var isSellerSearch: Bool = false
    
    var sortTapGesture: UITapGestureRecognizer!
    var filterTapGesture: UITapGestureRecognizer!
    var viewTypeTapGesture: UITapGestureRecognizer!
    
    var pageTitle: String = ""
    var sellerId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeViews()
        self.backButton()
        self.initializeLocalizedString()
        self.registerNibs()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fullDimView = UIView(frame: UIScreen.mainScreen().bounds)
        fullDimView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.navigationController?.view.addSubview(fullDimView!)
        //self.view.addSubview(dimView!)
        fullDimView?.hidden = true
        fullDimView?.alpha = 0
        
        
        self.navigationController?.navigationBar.alpha = 1
        self.navigationController?.navigationBar.barTintColor = Constants.Colors.appTheme
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        if !isSellerSearch {
            initializeTapGestures()
        } else {
            actionViewHeight.constant = 0
            page = 1
        }
        
//        if targetType == TargetType.TodaysPromo {
//            requestSuggestionSearchUrl = APIAtlas.todaysPromo
//            requestSearchDetails(requestSuggestionSearchUrl, params: nil)
//        }
        
        println(self.sellerId)
        requestSearchDetails("\(APIAtlas.productList)?sellerIds[0]=\(sellerId)", params: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func passSearchKey(key: String) {
    }
    
    // MARK : Initializations
    func initializeLocalizedString() {
        listLocalizeString = StringHelper.localizedStringWithKey("LIST_LOCALIZE_KEY")
        gridMessageLocalizeString = StringHelper.localizedStringWithKey("GRID_LOCALIZE_KEY")
        
        let oldToNewLocalizeString: String = StringHelper.localizedStringWithKey("OLDTONEW_LOCALIZE_KEY")
        let newToOldLocalizeString: String = StringHelper.localizedStringWithKey("NEWTOOLD_LOCALIZE_KEY")
        let AToZLocalizeString: String = StringHelper.localizedStringWithKey("ATOZ_LOCALIZE_KEY")
        let ZToALocalizeString: String = StringHelper.localizedStringWithKey("ZTOA_LOCALIZE_KEY")
        let filterLocalizeString: String = StringHelper.localizedStringWithKey("FILTER_LOCALIZE_KEY")
        let sortLocalizeString: String = StringHelper.localizedStringWithKey("SORT_LOCALIZE_KEY")
        
        sortData.append(oldToNewLocalizeString)
        sortData.append(newToOldLocalizeString)
        sortData.append(AToZLocalizeString)
        sortData.append(ZToALocalizeString)
        sortPickerTableView.reloadData()
        
        filterLabel.text = filterLocalizeString
        sortLabel.text = sortLocalizeString
        viewTypeLabel.text = listLocalizeString
    }
    
    func initializeViews() {
        var nib = UINib(nibName: "SortTableViewCell", bundle: nil)
        sortPickerTableView.registerNib(nib, forCellReuseIdentifier: "SortTableViewCell")
        
        //Add Nav Bar
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: UIFont(name: "Panton-Regular", size: 21)!]
        
        if pageTitle.isEmpty {
            let resultsLocalizeString: String = StringHelper.localizedStringWithKey("RESULTS_LOCALIZE_KEY")
            self.title = resultsLocalizeString
        } else {
            self.title = pageTitle
        }
        
        //hide dimview
        dimView.alpha = 0
        dimView.hidden = true
        
        fullDimView = UIView(frame: self.view.bounds)
        fullDimView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.navigationController?.view.addSubview(fullDimView!)
        fullDimView?.hidden = true
        fullDimView?.alpha = 0
        
        noResultLabel.hidden = true
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
    
    
    
    func initializeTapGestures() {
        // Add tap event to Sort View
        sortTapGesture = UITapGestureRecognizer(target:self, action:"tapSortViewAction")
        sortView.addGestureRecognizer(sortTapGesture)
        
        // Add tap event to Sort View
        filterTapGesture = UITapGestureRecognizer(target:self, action:"tapFilterViewAction")
        filterView.addGestureRecognizer(filterTapGesture)
        
        // Add tap event to Sort View
        viewTypeTapGesture = UITapGestureRecognizer(target:self, action:"tapViewTypeViewAction")
        viewTypeView.addGestureRecognizer(viewTypeTapGesture)
    }
    
    func registerNibs() {
        var cellNibGrid = UINib(nibName: reuseIdentifierGrid, bundle: nil)
        self.resultCollectionView?.registerNib(cellNibGrid, forCellWithReuseIdentifier: reuseIdentifierGrid)
        
        var cellNibList = UINib(nibName: reuseIdentifierList, bundle: nil)
        self.resultCollectionView?.registerNib(cellNibList, forCellWithReuseIdentifier: reuseIdentifierList)
        
        var cellNib = UINib(nibName: reuseIdentifierSeller, bundle: nil)
        self.resultCollectionView?.registerNib(cellNib, forCellWithReuseIdentifier: reuseIdentifierSeller)
    }
    
    func goBack(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func passCategoryID(id: Int) {
        if Reachability.isConnectedToNetwork() {
            requestSuggestionSearchUrl = "\(APIAtlas.productList)?sellerId=\(sellerId)"
            requestSearchDetails("\(APIAtlas.productList)?sellerId=\(sellerId)", params: nil)
        } else {
            UIAlertController.displayNoInternetConnectionError(self)
        }
    }
    
    func passModel(searchSuggestion: SearchSuggestionModel) {
        self.searchSuggestion = searchSuggestion
        
        if isSellerSearch {
            type = ""
        } else {
            type = "GRID"
        }
        
        if Reachability.isConnectedToNetwork() {
            //requestSuggestionSearchUrl = searchSuggestion.searchUrl
            requestSearchDetails(requestSuggestionSearchUrl, params: nil)
        } else {
            UIAlertController.displayNoInternetConnectionError(self)
        }
    }
    
    // MARK: API Request
    func requestSearchDetails(url: String, params: NSDictionary!) {
        println("URL \(url)\nPARAMS:\(params)")
        if (collectionViewData.count % 15) == 0 || page == 0 {
            println("\(collectionViewData.count) \(totalResultCount)")
            
            if page == 0 {
                page = 1
            }
            
            if( initialParameters == nil ) {
                initialParameters = (targetUrl: url, parameters: params)
            }
            
            showLoader()
            
            var tempURL: String = url
            
            if !tempURL.contains("?") &&  tempURL.contains("&") {
                let rOriginal = tempURL.rangeOfString("&")
                tempURL = tempURL.stringByReplacingCharactersInRange(rOriginal!, withString: "?")
            }
            
            manager.GET(tempURL, parameters: params, success: {
                (task: NSURLSessionDataTask!, responseObject: AnyObject!) in print(responseObject as! NSDictionary)
                
                println(responseObject)
                if responseObject.objectForKey("error") != nil {
                    self.requestRefreshToken(url, params: params)
                } else {
                    self.populateTableView(responseObject)
                    self.page++
                }
                }, failure: {
                    (task: NSURLSessionDataTask!, error: NSError!) in
                    if task.response as? NSHTTPURLResponse != nil {
                        let task: NSHTTPURLResponse = task.response as! NSHTTPURLResponse
                        
                        if task.statusCode == 401 {
                            self.requestRefreshToken( url, params: params)
                        } else {
                            UIAlertController.displaySomethingWentWrongError(self)
                            self.dismissLoader()
                        }
                    }
            })
        } else {
            let noMoreLocalizeString: String = StringHelper.localizedStringWithKey("NOMORERESULTS_LOCALIZE_KEY")
            let resultsLocalizeString: String = StringHelper.localizedStringWithKey("RESULTS_LOCALIZE_KEY")
            UIAlertController.displayErrorMessageWithTarget(self, errorMessage: noMoreLocalizeString, title: resultsLocalizeString)
        }
    }
    
    func requestRefreshToken(url: String, params: NSDictionary!) {
        let urlTemp: String = APIAtlas.refreshTokenUrl
        let params: NSDictionary = ["client_id": Constants.Credentials.clientID(),
            "client_secret": Constants.Credentials.clientSecret(),
            "grant_type": Constants.Credentials.grantRefreshToken,
            "refresh_token": SessionManager.refreshToken()]
        
        let manager = APIManager.sharedInstance
        manager.POST(urlTemp, parameters: params, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            self.dismissLoader()
            SessionManager.parseTokensFromResponseObject(responseObject as! NSDictionary)
            var paramsTemp: Dictionary<String, String> = params as! Dictionary<String, String>
            paramsTemp["access_token"] = SessionManager.accessToken()
            self.requestSearchDetails(url, params: params)
            
            }, failure: {
                (task: NSURLSessionDataTask!, error: NSError!) in
                self.dismissLoader()
                let task: NSHTTPURLResponse = task.response as! NSHTTPURLResponse
                UIAlertController.displaySomethingWentWrongError(self)
                
        })
    }
    
    // MARK: Delegates
    // MARK: Functions Updating Values
    func populateTableView(responseObject: AnyObject) {
        if let value: NSDictionary = responseObject["data"] as? NSDictionary{
            if let value: AnyObject = value["totalResultCount"] {
                if value as! NSObject != NSNull() {
                    totalResultCount = value as! Int
                }
            }
            
            for subValue in value["products"] as! NSArray {
                println(subValue)
                let model: SearchResultModel = SearchResultModel.parseDataWithDictionary(subValue as! NSDictionary)
                self.collectionViewData.append(model)
            }
            
            if let aggregations: AnyObject = value["aggregations"] {
                if aggregations as! NSObject != NSNull() {
                    
                    if let subValue: AnyObject = aggregations["maxPrice"] {
                        if subValue as! NSObject != NSNull() {
                            if maxPrice == 0{
                                maxPrice = subValue as! Double
                                selectedMaxPrice = maxPrice
                            }
                        }
                    }
                    
                    if let subValue: AnyObject = aggregations["minPrice"] {
                        if subValue as! NSObject != NSNull() {
                            if maxPrice == 0{
                                minPrice = subValue as! Double
                                selectedMinPrice = minPrice
                            }
                        }
                    }
                    
                    if let attributes: AnyObject = aggregations["attributes"] {
                        if filterAtributes.count == 0 {
                            filterAtributes.removeAll(keepCapacity: false)
                            if attributes as! NSObject != NSNull() {
                                for attribute in attributes as! NSArray {
                                    filterAtributes.append(FilterAttributeModel.parseDataWithDictionary(attribute as! NSDictionary))
                                }
                            }
                        }
                    }
                }
            }
            
            if filterAtributes.count != 0 && maxPrice > 0{
                filterView.alpha = 1
            } else {
                filterView.alpha = 0.5
            }
            
            self.resultCollectionView.reloadSections(NSIndexSet(index: 0))
        }
        self.dismissLoader()
        
        if self.collectionViewData.count == 0 {
            noResultLabel.hidden = false
        }
    }
    
    func populateSellerTableView(responseObject: AnyObject) {
        
        for subValue in responseObject["data"]  as! NSArray {
            println(subValue)
            let model: SearchSellerModel = SearchSellerModel.parseDataWithDictionary(subValue as! NSDictionary)
            self.sellerCollectionViewData.append(model)
        }
        
        
        self.dismissLoader()
        self.resultCollectionView.reloadData()
        if self.sellerCollectionViewData.count == 0 {
            noResultLabel.hidden = false
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSellerSearch {
            return sellerCollectionViewData.count
        } else {
            return collectionViewData.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if type == grid {
            let cell: ProductResultGridCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierGrid, forIndexPath: indexPath) as! ProductResultGridCollectionViewCell
            var tempModel: SearchResultModel = collectionViewData[indexPath.row]
            cell.setProductImage(tempModel.imageUrl)
            cell.setProductName(tempModel.productName)
            cell.setOriginalPrice(tempModel.originalPrice.formatToPeso())
            cell.setNewPrice(tempModel.newPrice.formatToPeso())
            cell.setDiscount("\(tempModel.discount)")
            return cell
        } else if type == list {
            let cell: ProductResultListCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierList, forIndexPath: indexPath) as! ProductResultListCollectionViewCell
            var tempModel: SearchResultModel = collectionViewData[indexPath.row]
            cell.setProductImage(tempModel.imageUrl)
            cell.setProductName(tempModel.productName)
            cell.setOriginalPrice(tempModel.originalPrice.formatToPeso())
            cell.setNewPrice(tempModel.newPrice.formatToPeso())
            cell.setDiscount("\(tempModel.discount)")
            return cell
        } else{
            let cell: SellerResultCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierSeller, forIndexPath: indexPath) as! SellerResultCollectionViewCell
            var tempModel: SearchSellerModel = sellerCollectionViewData[indexPath.row]
            cell.sellerNameLabel.text = tempModel.storeName
            cell.specialtyLabel.text = tempModel.specialty
            cell.sellerImageView.sd_setImageWithURL(NSURL(string: tempModel.image), placeholderImage: UIImage(named: "dummy-placeholder"))
            cell.descriptionLabel.text = tempModel.productDescription
            
            for subValue in tempModel.products {
                cell.productIds.append(subValue.productId)
                
                if !subValue.image.isEmpty {
                    cell.productImages.append(subValue.image)
                } else {
                    cell.productImages.append(" ")
                }
            }
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if type == grid {
            return CGSize(width: ((screenWidth / 2) - 0.5), height: 185)
        } else if type == list {
            return CGSize(width: screenWidth, height: 120)
        } else {
            return CGSize(width: screenWidth, height: 225)
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if isSellerSearch {
            let sellerViewController: SellerViewController = SellerViewController(nibName: "SellerViewController", bundle: nil)
            sellerViewController.sellerId = sellerCollectionViewData[indexPath.row].userId
            self.navigationController!.pushViewController(sellerViewController, animated: true)
        } else {
            let productViewController: ProductViewController = ProductViewController(nibName: "ProductViewController", bundle: nil)
            productViewController.tabController = self.tabBarController as! CustomTabBarController
            productViewController.productId = collectionViewData[indexPath.row].id
            
            println("ID \(collectionViewData[indexPath.row].id)")
            self.navigationController?.pushViewController(productViewController, animated: true)
        }
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SortTableViewCell", forIndexPath: indexPath) as! SortTableViewCell
        
        cell.detailsLabel?.text = sortData[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.3, animations: {
            self.dimView.alpha = 0
            }, completion: { finished in
                self.dimView.hidden = true
        })
        
        page = 0
        collectionViewData.removeAll(keepCapacity: false)
        resultCollectionView.reloadData()
        if Reachability.isConnectedToNetwork() {
            let sortParameterSelection = sortParameter[indexPath.row]
            if initialParameters != nil && initialParameters!.targetUrl != "" {
                requestSuggestionSearchUrl = "\(initialParameters!.targetUrl)&\(sortParameterSelection)"
                NSLog(requestSuggestionSearchUrl)
                requestSearchDetails(requestSuggestionSearchUrl, params: initialParameters!.parameters)
            }/* else {
            let requestSoloSearchUrl = "\(APIAtlas.productList)?\(sortParameterSelection)"
            NSLog(requestSoloSearchUrl)
            requestSearchDetails(requestSoloSearchUrl, params: nil)
            } */
            resultCollectionView.setContentOffset(CGPointZero, animated: true)
        } else {
            UIAlertController.displayNoInternetConnectionError(self)
        }
    }
    
    func scrollViewDidEndDragging(aScrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var offset: CGPoint = aScrollView.contentOffset
        var bounds: CGRect = aScrollView.bounds
        var size: CGSize = aScrollView.contentSize
        var inset: UIEdgeInsets = aScrollView.contentInset
        var y: CGFloat = offset.y + bounds.size.height - inset.bottom
        var h: CGFloat = size.height
        var reload_distance: CGFloat = 10
        var temp: CGFloat = h + reload_distance
        if y > temp {
            if page == 0{
                page++
            }
            requestSearchDetails(requestSuggestionSearchUrl, params: NSDictionary(dictionary: ["page": page]))
        }
    }
    
    // MARK: - FilterViewControllerDelegate
    func resetFilterViewControllerAction() {
        
    }
    
    func cancelFilterViewControllerAction() {
        hideDimView()
    }
    
    func applyFilterViewControllerAction(maxPrice: Double, minPrice: Double, filters: NSDictionary) {
        hideDimView()
        page = 0
        collectionViewData.removeAll(keepCapacity: false)
        resultCollectionView.reloadData()
        requestSearchDetails(requestSuggestionSearchUrl, params: NSDictionary(dictionary: [
            "priceFrom": minPrice,
            "priceTo": maxPrice,
            "filters": [filters]]))
        selectedMaxPrice = maxPrice
        selectedMinPrice = minPrice
    }
    
    // MARK : - Functions
    //Loader function
    func showLoader() {
       self.yiHud = YiHUD.initHud()
       self.yiHud!.showHUDToView(self.view)
    }
    
    func dismissLoader() {
        self.yiHud?.hide()
    }
    
    func changeViewType() {
        if isSellerSearch {
            type = ""
            viewTypeImageView.image = UIImage(named: "grid")
            viewTypeLabel.text = gridMessageLocalizeString
        } else {
            if type == grid {
                type = list
                viewTypeImageView.image = UIImage(named: "grid")
                viewTypeLabel.text = gridMessageLocalizeString
            } else if type == list {
                type = grid
                viewTypeImageView.image = UIImage(named: "list")
                viewTypeLabel.text = listLocalizeString
            } else {
                //            type = grid
            }
        }
        
        self.resultCollectionView?.reloadData()
    }
    
    func hideDimView() {
        UIView.animateWithDuration(0.3, animations: {
            self.fullDimView!.alpha = 0
            }, completion: { finished in
                self.fullDimView!.hidden = true
        })
    }
    
    // Tap Gesture Action
    func tapSortViewAction() {
        println("Sort Tapped!")
        if dimView.hidden {
            UIView.animateWithDuration(0.3, animations: {
                self.dimView.hidden = false
                self.dimView.alpha = 1.0
            })
        } else {
            UIView.animateWithDuration(0.3, animations: {
                self.dimView.alpha = 0
                }, completion: { finished in
                    self.dimView.hidden = true
            })
        }
    }
    
    func tapFilterViewAction() {
        if filterAtributes.count != 0 {
            filterView.alpha = 1
            var attributeModal = FilterViewController(nibName: "FilterViewController", bundle: nil)
            attributeModal.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
            attributeModal.providesPresentationContextTransitionStyle = true
            attributeModal.definesPresentationContext = true
            attributeModal.delegate = self
            attributeModal.passFilter(filterAtributes, maxPrice: maxPrice, minPrice: minPrice)
            attributeModal.maxPrice = maxPrice
            attributeModal.minPrice = minPrice
            attributeModal.selectedMaxPrice = selectedMaxPrice
            attributeModal.selectedMinPrice = selectedMinPrice
            self.tabBarController?.presentViewController(attributeModal, animated: true, completion: nil)
            
            self.fullDimView!.hidden = false
            UIView.animateWithDuration(0.3, animations: {
                self.fullDimView!.alpha = 1
                }, completion: { finished in
            })
        } else {
            filterView.alpha = 0.5
        }
    }
    
    func tapViewTypeViewAction() {
        self.changeViewType()
    }
}
