//
//  TransactionDeliveryLogTableViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 10/23/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class TransactionDeliveryLogTableViewController: UITableViewController {
    
    var deliveryLogCellIdentifier: String = "TransactionDeliveryLogTableViewCell"
    var signatureCellIdentifier: String = "TransactionDeliveryLogSignatureTableViewCell"
    
    var orderProductId: String = ""
    var transactionId: String = ""
    var yiHud: YiHUD?
    var tableHeaderView: UIView!
    var tidLabel: UILabel!
    var noDeliveryLog: UIView!
    var noDeliveryLabel: UILabel!
    var deliveryLogs: DeliveryLogsModel!
    var tableData: [DeliveryLogsSectionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deliveryLogs = DeliveryLogsModel(isSuccessful: false, message: "", orderProductId: "", productName: "", deliveryLogs: [])
        
        initializeNavigationBar()
        registerNibs()
        initializeTableView()
        fireGetDeliveryLogs()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNibs() {
        var deliveryNib = UINib(nibName: deliveryLogCellIdentifier, bundle: nil)
        self.tableView.registerNib(deliveryNib, forCellReuseIdentifier: deliveryLogCellIdentifier)
        
        var signatureNib = UINib(nibName: signatureCellIdentifier, bundle: nil)
        self.tableView.registerNib(signatureNib, forCellReuseIdentifier: signatureCellIdentifier)
    }
    
    
    func initializeTableView() {
        tableHeaderView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, 35))
        tableHeaderView.backgroundColor = UIColor.whiteColor()
        
        tidLabel = UILabel(frame: CGRectMake(16, 10, (self.view.bounds.width - 32), 20))
        tidLabel.textColor = Constants.Colors.grayText
        tidLabel.font = UIFont(name: "Panton-Bold", size: CGFloat(14))
        tidLabel.text = "TID-\(transactionId)"
        tableHeaderView.addSubview(tidLabel)
        
        self.tableView.tableHeaderView = tableHeaderView
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func noDeliveryLogsView() {
        noDeliveryLog = UIView(frame: CGRectMake(0, tableHeaderView.bounds.height, self.view.bounds.width, self.view.bounds.height - tableHeaderView.bounds.height))
        noDeliveryLog.backgroundColor = UIColor.whiteColor()
        
        noDeliveryLabel = UILabel(frame: CGRectMake(0, noDeliveryLog.bounds.height/2, self.view.bounds.width, 20))
        noDeliveryLabel.textColor = Constants.Colors.grayText
        noDeliveryLabel.textAlignment = NSTextAlignment.Center
        noDeliveryLabel.font = UIFont(name: "Panton-Bold", size: CGFloat(14))
        noDeliveryLabel.text = StringHelper.localizedStringWithKey("TRANSACTION_NO_DELIVERY_STATUS_LOCALIZE_KEY")
        noDeliveryLog.addSubview(noDeliveryLabel)
        
        self.tableView.addSubview(noDeliveryLog)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func initializeNavigationBar() {
        self.title = "Delivery Log"
        
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
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].deliveryLogs.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let model: DeliveryLogsItemModel = tableData[indexPath.section].deliveryLogs[indexPath.row]
        
        if !model.clientSignature.isEmpty{
            let cell: TransactionDeliveryLogSignatureTableViewCell = tableView.dequeueReusableCellWithIdentifier(signatureCellIdentifier, forIndexPath: indexPath) as! TransactionDeliveryLogSignatureTableViewCell
            
            cell.signatureImageView.sd_setImageWithURL(NSURL(string: model.clientSignature), placeholderImage: UIImage(named: "dummy-placeholder"))
            cell.setActionType(model.actionType)
            cell.timeLabel.text = formatDateToTimeString(formatStringToDate(model.date))
            cell.dateLabel.text = formatDateToCompleteString(formatStringToDate(model.date))
            cell.locationLabel.text = model.location
            cell.riderLabel.text = model.riderName
            
            return cell
        } else {
            let cell: TransactionDeliveryLogTableViewCell = tableView.dequeueReusableCellWithIdentifier(deliveryLogCellIdentifier, forIndexPath: indexPath) as! TransactionDeliveryLogTableViewCell
            
            cell.typeLabel.text = model.actionType
            cell.timeLabel.text = formatDateToTimeString(formatStringToDate(model.date))
            cell.dateLabel.text = formatDateToCompleteString(formatStringToDate(model.date))
            cell.locationLabel.text = model.location
            cell.riderLabel.text = model.riderName
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return setSectionHeader(tableData[section].date)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let model: DeliveryLogsItemModel = tableData[indexPath.section].deliveryLogs[indexPath.row]
        
        if model.clientSignature.isEmpty{
            return 160
        } else {
            return 275
        }
    }
    
    // MARK: - Methods
    
    func setSectionHeader(date: String) -> UIView {
        var sectionHeaderView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.tableView.sectionHeaderHeight))
        sectionHeaderView.backgroundColor = UIColor(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0)
        var middleLine: UIView = UIView(frame: CGRectMake(0, 0, sectionHeaderView.frame.size.width, 0.5))
        middleLine.backgroundColor = .grayColor()
        middleLine.center.y = sectionHeaderView.center.y + (15 / 2)
        sectionHeaderView.addSubview(middleLine)
        
        var dateLabel: UILabel = UILabel(frame: CGRectMake(0, 0, sectionHeaderView.frame.size.width, 20))
        dateLabel.textAlignment = .Center
        dateLabel.font = UIFont.systemFontOfSize(12.0)
        dateLabel.textColor = .grayColor()
        dateLabel.text = "  " + date + "  "
        dateLabel.sizeToFit()
        dateLabel.backgroundColor = UIColor(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0)
        dateLabel.frame.size.width = dateLabel.frame.size.width + 10
        dateLabel.center.x = sectionHeaderView.center.x
        dateLabel.center.y = sectionHeaderView.center.y + (15 / 2)
        
        sectionHeaderView.addSubview(dateLabel)
        
        return sectionHeaderView
    }
    
    func showHUD() {
        self.yiHud = YiHUD.initHud()
        self.yiHud!.showHUDToView(self.view)
    }
    
    func initializeDeliveryLogsItem() {
        tableData.removeAll(keepCapacity: false)
        var tempDates: [String] = []
        
        // Get all dates
        if deliveryLogs.deliveryLogs.count != 0 {
            for subValue in deliveryLogs.deliveryLogs {
                if !contains(tempDates, formatDateToCompleteString(formatStringToDate(subValue.date))) {
                    tempDates.append(formatDateToCompleteString(formatStringToDate(subValue.date)))
                    tableData.append(DeliveryLogsSectionModel(date: formatDateToCompleteString(formatStringToDate(subValue.date)), deliveryLogs: []))
                }
            }
            
            println(tempDates)
            
            // Segregatiom of details falls within same date
            for var i = 0; i < tableData.count; i++ {
                for subValue in deliveryLogs.deliveryLogs {
                    if formatDateToCompleteString(formatStringToDate(subValue.date)) == tableData[i].date {
                        tableData[i].deliveryLogs.append(DeliveryLogsItemModel(actionType: subValue.actionType, date: subValue.date, location: subValue.location, riderName: subValue.riderName, clientSignature: subValue.clientSignature))
                    }
                }
            }
            
            self.tableView.reloadData()
        } else {
            self.noDeliveryLogsView()
        }
        
    }
    
    func fireGetDeliveryLogs() {
        
        self.showHUD()
         var parameters: NSDictionary = NSDictionary(dictionary: ["access_token": SessionManager.accessToken(), "orderProductId": orderProductId])
        
        WebServiceManager.fireGetDeliveryLogsWithUrl(APIAtlas.getDeliveryLogs, parameters: parameters, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            if successful {
                self.deliveryLogs = DeliveryLogsModel.parseDataWithDictionary(responseObject as! NSDictionary)
                
                if self.deliveryLogs.isSuccessful {
                    self.initializeDeliveryLogsItem()
                } else {
                    UIAlertController.displayErrorMessageWithTarget(self, errorMessage: self.deliveryLogs.message, title: StringHelper.localizedStringWithKey("ERROR_LOCALIZE_KEY"))
                }
                
                self.yiHud?.hide()
            } else {
                self.yiHud?.hide()
                if requestErrorType == .ResponseError {
                    //Error in api requirements
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    UIAlertController.displayErrorMessageWithTarget(self, errorMessage: errorModel.message, title: Constants.Localized.error)
                } else if requestErrorType == .AccessTokenExpired {
                    self.fireRefreshToken()
                } else if requestErrorType == .PageNotFound {
                    //Page not found
                    Toast.displayToastWithMessage(Constants.Localized.pageNotFound, duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    //No internet connection
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    //Request timeout
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    //Unhandled error
                    UIAlertController.displayErrorMessageWithTarget(self, errorMessage: Constants.Localized.someThingWentWrong, title: Constants.Localized.error)
                }
            }
        })
    }
    
    func fireRefreshToken() {
        self.showHUD()
        WebServiceManager.fireRefreshTokenWithUrl(APIAtlas.refreshTokenUrl, actionHandler: {
            (successful, responseObject, requestErrorType) -> Void in
            self.yiHud?.hide()
            
            if successful {
                SessionManager.parseTokensFromResponseObject(responseObject as! NSDictionary)
                
                self.fireGetDeliveryLogs()
            } else {
                //Forcing user to logout.
                UIAlertController.displayAlertRedirectionToLogin(self, actionHandler: { (sucess) -> Void in
                    
                })
            }
        })
    }
    
    
    func formatStringToDate(date: String) -> NSDate {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
        
        return dateFormatter.dateFromString(date)!
    }
    
    func formatDateToString(date: NSDate) -> String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
        return dateFormatter.stringFromDate(date)
    }
    
    func formatDateToTimeString(date: NSDate) -> String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "kk:mm aa"
        return dateFormatter.stringFromDate(date)
    }
    
    func formatDateToCompleteString(date: NSDate) -> String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.stringFromDate(date)
    }
}
