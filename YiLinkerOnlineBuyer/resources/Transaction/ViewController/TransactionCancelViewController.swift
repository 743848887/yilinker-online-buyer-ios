//
//  TransactionCancelViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Joriel Oller Fronda on 9/11/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

protocol TransactionCancelViewControllerDelegate {
    func submitTransactionCancelReason()
    func dismissView()
}

class TransactionCancelViewController: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var submitButton: DynamicRoundedButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var reasonOfCancellationLabel: UILabel!
    @IBOutlet weak var typeOfReasonLabel: UILabel!
    @IBOutlet weak var remarksLabel: UILabel!
    @IBOutlet weak var remarksTextView: UITextView!
    @IBOutlet weak var reasonTextField: UITextField!
    
    var delegate: TransactionCancelViewControllerDelegate?
    var cancellationModels: [TransactionCancellationModel] = []
    var yiHud: YiHUD?
    
    var selectedRow: Int = 0
    var invoiceNumber: String = ""
    var orderProductId: String = ""
    
    var reasonOfCancellation = StringHelper.localizedStringWithKey("TRANSACTION_CANCEL_ORDER_REASON_LOCALIZE_KEY")
    var typeOfReason = StringHelper.localizedStringWithKey("TRANSACTION_CANCEL_ORDER_TYPE_LOCALIZE_KEY")
    var remarks = StringHelper.localizedStringWithKey("TRANSACTION_CANCEL_ORDER_REMARKS_LOCALIZE_KEY")
    var submit = StringHelper.localizedStringWithKey("TRANSACTION_CANCEL_ORDER_SUBMIT_LOCALIZE_KEY")
    var selectReason = StringHelper.localizedStringWithKey("TRANSACTION_CANCEL_ORDER_SELECT_LOCALIZE_KEY")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remarksTextView.layer.cornerRadius = 5.0
        remarksTextView.clipsToBounds = true
        
        //Add picker
        addPicker()
        
        //Set up view
        self.reasonOfCancellationLabel.text = reasonOfCancellation
        self.typeOfReasonLabel.text = typeOfReason
        self.remarksLabel.text = remarks
        self.reasonTextField.placeholder = selectReason
        self.submitButton.setTitle(submit, forState: UIControlState.Normal)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Get reasons for cancellation
        fireGetReasonForCancellation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        self.delegate?.dismissView()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func submitAction(sender: AnyObject) {
        if self.reasonTextField.text != "" || self.remarksTextView.text != "" {
            self.firePostCancellation()
        } else {
            UIAlertController.displayErrorMessageWithTarget(self, errorMessage: "All fields are required.", title: Constants.Localized.error)
        }
        
    }
    
    @IBAction func textFieldDidBeginEditing(sender: AnyObject) {
        //Adjust top constraint based on iphone size
        if IphoneType.isIphone4() {
            topConstraint.constant = 40
        } else if IphoneType.isIphone5() {
            topConstraint.constant = 60
        } else {
            topConstraint.constant = 100
        }
    }
    
    // MARK : UIPickerViewDelegate
    func addPicker() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let pickerView: UIPickerView = UIPickerView(frame:CGRectMake(0, 0, screenSize.width, 225))
        pickerView.delegate = self
        pickerView.dataSource = self
        self.reasonTextField.inputView = pickerView
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return cancellationModels.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return self.cancellationModels[row].cancellationReason
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reasonTextField.text = self.cancellationModels[row].cancellationReason
        selectedRow = row
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    {
        var pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = self.cancellationModels[row].cancellationReason
        pickerLabel.numberOfLines = 0
        pickerLabel.font = UIFont(name: "Panton-Regular", size: 12)
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    //MARK: Textfield delegate method
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }

    //MARK: Get reasons for cancelling transaction
    func fireGetReasonForCancellation(){
        
        self.showHUD()
        WebServiceManager.fireGetReasonForCancellationWithUrl(APIAtlas.transactionCancellation) {
            (successful, responseObject, requestErrorType) -> Void in
            if successful {
                var response: NSDictionary = responseObject as! NSDictionary
                if response["isSuccessful"] as! Bool {
                    for subValue in response["data"] as! NSArray {
                        self.cancellationModels.append(TransactionCancellationModel.parseDataWithDictionary(subValue as! NSDictionary))
                    }
                } else {
                    UIAlertController.displayErrorMessageWithTarget(self, errorMessage: response["message"] as! String, title: "Error")
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate?.dismissView()
                }
                
                self.yiHud?.hide()
            } else {
                self.yiHud?.hide()
                if requestErrorType == .ResponseError {
                    //Error in api requirements
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    //Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                    UIAlertController.displayErrorMessageWithTarget(self, errorMessage: errorModel.message, title: Constants.Localized.someThingWentWrong)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate?.dismissView()
                } else if requestErrorType == .AccessTokenExpired {
                    self.fireRefreshToken(CancellationType.GetReason)
                } else if requestErrorType == .PageNotFound {
                    //Page not found
                    Toast.displayToastWithMessage(Constants.Localized.pageNotFound, duration: 1.5, view: self.view)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate?.dismissView()
                } else if requestErrorType == .NoInternetConnection {
                    //No internet connection
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate?.dismissView()
                } else if requestErrorType == .RequestTimeOut {
                    //Request timeout
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate?.dismissView()
                } else if requestErrorType == .UnRecognizeError {
                    //Unhandled error
                    UIAlertController.displayErrorMessageWithTarget(self, errorMessage: Constants.Localized.someThingWentWrong, title: Constants.Localized.error)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.delegate?.dismissView()
                }
            }
        }
    }
    
    //MARK: Cancel transaction
    func firePostCancellation(){
        
        self.showHUD()
        
        let manager = APIManager.sharedInstance
        let parameters: NSDictionary = ["access_token" : SessionManager.accessToken(),
            "transactionId": invoiceNumber,
            "reasonId": cancellationModels[selectedRow].cancellationId,
            "remark": remarksTextView.text, "orderProductId": orderProductId];
        
        WebServiceManager.fireCancelTransactionWithUrl(APIAtlas.postTransactionCancellation, parameters: parameters, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            if successful {
                self.delegate?.dismissView()
                self.dismissViewControllerAnimated(true, completion: nil)
                self.delegate?.submitTransactionCancelReason()
                
                self.yiHud?.hide()
            } else {
                self.yiHud?.hide()
                if requestErrorType == .ResponseError {
                    //Error in api requirements
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .AccessTokenExpired {
                    self.fireRefreshToken(CancellationType.PostReason)
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
    
    //MARK: Refresh tokens
    func fireRefreshToken(type: CancellationType) {
        
        self.showHUD()
        
        let manager = APIManager.sharedInstance
        let parameters: NSDictionary = [
            "client_id": Constants.Credentials.clientID(),
            "client_secret": Constants.Credentials.clientSecret(),
            "grant_type": Constants.Credentials.grantRefreshToken,
            "refresh_token": SessionManager.refreshToken()]
        
        manager.POST(APIAtlas.refreshTokenUrl, parameters: parameters, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            
            SessionManager.parseTokensFromResponseObject(responseObject as! NSDictionary)
            
            if type == CancellationType.GetReason {
                self.fireGetReasonForCancellation()
            } else {
                self.firePostCancellation()
            }
            
            }, failure: {
                (task: NSURLSessionDataTask!, error: NSError!) in
                
                let task: NSHTTPURLResponse = task.response as! NSHTTPURLResponse
                let dictionary: NSDictionary = (error.userInfo as? Dictionary<String, AnyObject>)!
                let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(dictionary)
                UIAlertController.displayErrorMessageWithTarget(self, errorMessage: errorModel.message, title: Constants.Localized.someThingWentWrong)
                self.yiHud?.hide()
        }) 
    }
    
    //MARK: Show HUD
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
