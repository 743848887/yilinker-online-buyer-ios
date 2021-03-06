//
//  LoginAndRegisterTableViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 1/26/16.
//  Copyright (c) 2016 yiLinker-online-buyer. All rights reserved.
//

import UIKit

struct LoginStrings {
    static let enterEmailAddress: String = StringHelper.localizedStringWithKey("ENTER_EMAIL_ADDRESS_LOCALIZE_KEY")
    static let enterPassword: String = StringHelper.localizedStringWithKey("ENTER_PASSWORD_ADDRESS_LOCALIZE_KEY")
    
    static let mismatch: String = StringHelper.localizedStringWithKey("MISMATCH_LOCALIZE_KEY")
    static let loginFailed: String = StringHelper.localizedStringWithKey("LOGIN_FAILED_LOCALIZE_KEY")
    static let password: String = StringHelper.localizedStringWithKey("PASSWORD_LOCALIZE_KEY")
    
    static let emailIsRequired: String = StringHelper.localizedStringWithKey("INVALID_EMAIL_REQUIRED_LOCALIZE_KEY")
    static let invalidEmail: String = StringHelper.localizedStringWithKey("INVALID_EMAIL_REQUIRED_LOCALIZE_KEY")
    static let mobileIsRequired: String = StringHelper.localizedStringWithKey("MOBILE_IS_REQUIRED_LOCALIZE_KEY")
    static let invalidMobile: String = StringHelper.localizedStringWithKey("INVALID_MOBILE_REQUIRED_LOCALIZE_KEY")
    static let passwordIsRequired: String = StringHelper.localizedStringWithKey("PASSWORD_IS_REQUIRED_LOCALIZE_KEY")
    
    static let successMessage: String = StringHelper.localizedStringWithKey("SUCCESS_LOGIN_LOCALIZE_KEY")
     static let welcomMessage: String = StringHelper.localizedStringWithKey("WELCOME_LOCALIZE_KEY")
    static let or: String = StringHelper.localizedStringWithKey("OR_LOCALIZE_KEY")
    static let forgotPasswordd: String = StringHelper.localizedStringWithKey("FORGOT_PASSWORD_LOCALIZE_KEY")
    static let signIn: String = StringHelper.localizedStringWithKey("SIGNIN_HIDDEN_LOCALIZE_KEY")
    static let byMobile: String = StringHelper.localizedStringWithKey("BY_MOBILE_LOCALIZE_KEY")
    static let byEmail: String = StringHelper.localizedStringWithKey("BY_EMAIL_LOCALIZE_KEY")
    static let mobileNUmber: String = StringHelper.localizedStringWithKey("MOBILE_NUMBER_LOCALIZE_KEY")
    static let emailAddress: String = StringHelper.localizedStringWithKey("EMAIL_ADDRESS_LOCALIZE_KEY")
    static let forgotPassword: String = StringHelper.localizedStringWithKey("FORGOT_PASSWORD_LOCALIZE_KEY")
    static let successForgotPassword: String = StringHelper.localizedStringWithKey("FORGOT_PASSWORD_SUCCESS_LOCALIZE_KEY")
    
    static let accountTitle: String = StringHelper.localizedStringWithKey("ACCOUNT_TITLE_LOCLAIZE_KEY")
    static let registerTitle: String = StringHelper.localizedStringWithKey("REGISTER_TITLE_LOCALIZE_KEY")
    static let resetTitle: String = StringHelper.localizedStringWithKey("RESET_PASSWORD_TITLE_LOCALIZE_KEY")
    static let login: String = StringHelper.localizedStringWithKey("LOGIN_LOCALIZE_KEY")
    
    static let selectLanguage: String = StringHelper.localizedStringWithKey("REGISTER_SELECT_LANGUAGE_LOCALIZED_KEY")
    static let chooseLanguage: String = StringHelper.localizedStringWithKey("REGISTER_CHOOSE_LANGUAGE_LOCALIZED_KEY")
    static let selectAreaCode: String = StringHelper.localizedStringWithKey("REGISTER_SELECT_AREA_CODE_LOCALIZED_KEY")
    static let chooseAreaCode: String = StringHelper.localizedStringWithKey("REGISTER_CHOOSE_AREA_CODE_LOCALIZED_KEY")
}


private struct LoginConstants {
    static let homeServerClientID = "231249450400-dso2pqhieqta2h78m9shhu8qs7gi3jji.apps.googleusercontent.com"
    static let forgotPasswordUrlString = APIEnvironment.baseUrl().stringByReplacingOccurrencesOfString("/api", withString: "/") + "forgot-password-request"
    
    static let emailKey = "email"
    static let passwordKey = "password"
    static let clientIdKey = "client_id"
    static let clientSecretKey = "client_secret"
    static let grantTypeKey = "grant_type"
    
    static let registrationIdKey = "registrationId"
    static let accessTokenKey = "access_token"
    
    static let tokenKey = "token"
}

struct RegisterStrings {
    static let firstName: String = StringHelper.localizedStringWithKey("FIRST_NAME_LOCALIZE_KEY")
    static let lastName: String = StringHelper.localizedStringWithKey("LAST_NAME_LOCALIZE_KEY")
    static let emailAddress: String = StringHelper.localizedStringWithKey("EMAIL_ADDRESS_LOCALIZE_KEY")
    static let password: String = StringHelper.localizedStringWithKey("PASSWORD_LOCALIZE_KEY")
    static let confirmPassword: String = StringHelper.localizedStringWithKey("CONFIRMPASSWORD_LOCALIZE_KEY")
    static let newPassword: String = StringHelper.localizedStringWithKey("NEWPASSWORD_LOCALIZE_KEY")
    static let confirmNewPassword: String = StringHelper.localizedStringWithKey("CONFIRMPASSWORD_NEW_LOCALIZE_KEY")
    static let mobileNumber: String = StringHelper.localizedStringWithKey("MOBILE_LOCALIZED_KEY")
    static let referral: String = StringHelper.localizedStringWithKey("REFERRAL_LOCALIZED_KEY")
    
    static let reTypePassword: String = StringHelper.localizedStringWithKey("RE_TYPE_PASSWORD_LOCALIZE_KEY")
    static let registerMeNow: String = StringHelper.localizedStringWithKey("REGISTER_ME_NOW_LOCALIZE_KEY")
    
    static let firstNameRequired: String = StringHelper.localizedStringWithKey("FIRST_NAME_REQUIRED_LOCALIZE_KEY")
    static let illegalFirstName: String = StringHelper.localizedStringWithKey("FIRST_NAME_ILLEGAL_LOCALIZE_KEY")
    static let lastNameRequired: String = StringHelper.localizedStringWithKey("LAST_NAME_REQUIRED_LOCALIZE_KEY")
    static let invalidLastName: String = StringHelper.localizedStringWithKey("INVALID_LAST_NAME_LOCALIZE_KEY")
    static let emailRequired: String = StringHelper.localizedStringWithKey("EMAIL_REQUIRED_LOCALIZE_KEY")
    
    static let invalidEmail: String = StringHelper.localizedStringWithKey("INVALID_EMAIL_LOCALIZE_KEY")
    static let passwordRequired: String = StringHelper.localizedStringWithKey("PASSWORD_REQUIRED_LOCALIZE_KEY")
    static let illegalPassword: String = StringHelper.localizedStringWithKey("ILLEGAL_PASSWORD_LOCALIZE_KEY")
    static let reTypePasswordError: String = StringHelper.localizedStringWithKey("RETYPE_REQUIRED_LOCALIZE_KEY")
    static let passwordNotMatch: String = StringHelper.localizedStringWithKey("PASSWORD_NOT_MATCH_LOCALIZE_KEY")
    static let activationCodeRequired: String = StringHelper.localizedStringWithKey("ACTIVATION_CODE_REQUIRED_LOCALIZE_KEY")
    static let contactRequired: String = StringHelper.localizedStringWithKey("CONTACT_REQUIRED_LOCALIZE_KEY")
    static let numbersAndLettersOnly: String = StringHelper.localizedStringWithKey("NUMBER_LETTERS_LOCALIZE_KEY")
    static let numbersAndLettersCombination: String = StringHelper.localizedStringWithKey("NUMBER_LETTERS_COMBINATION_LOCALIZE_KEY")
    static let successRegister: String = StringHelper.localizedStringWithKey("SUCCESS_REGISTER_LOCALIZED_KEY")
    static let thankyou: String = StringHelper.localizedStringWithKey("THANKYOU_LOCALIZED_KEY")
    
    static let eightCharacters: String = StringHelper.localizedStringWithKey("EIGHT_CHARACTERS_LOCALIZED_KEY")
    static let register: String = StringHelper.localizedStringWithKey("REGISTER_HIDDEN_LOCALIZE_KEY")
    static let getActivation: String = StringHelper.localizedStringWithKey("GET_ACTIVATION_LOCALIZED_KEY")
    static let activationCode: String = StringHelper.localizedStringWithKey("ACTIVATION_CODE_LOCALIZED_KEY")
    static let resetPassword: String = StringHelper.localizedStringWithKey("RESET_PASSWORD_LOCALIZED_KEY")
}

class LoginAndRegisterTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let headerViewNibName = "LoginHeaderTableViewCell"
    let loginResgisterTableViewCellNibName = "LoginRegisterTableViewCell"
    let logoRegisterTableViewCellNibName = "LoginRegisterLogoTableViewCell"
    let resetPasswordTableViewCellNibName = "ForgotPasswordTableViewCell"
    
    let headerCellHeight: CGFloat = 64
    let loginCellHeight: CGFloat = 400
    let logoCellHeight: CGFloat = 190
    let registerCellHeight: CGFloat = 462
    
    var hud: YiHUD?
    
    var loginSessionDataTask: NSURLSessionDataTask = NSURLSessionDataTask()
    
    var refferalCode: String = ""
    var isHideCloseButton: Bool = false
    var isGuestUser: Bool = false
    var isLogin: Bool = true
    var isResetPassword: Bool = false
    var isCloseButton: Bool = true
    var pageTitle: String = LoginStrings.accountTitle
    
    var registerModel: RegisterModel = RegisterModel()
    
    var tempSimplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell?
    var tempSimplifiedLoginCell: SimplifiedLoginUICollectionViewCell?
    var tempForgotPasswordCell: ForgotPasswordTableViewCell?
    
    var languageAlertView: LGAlertView?
    var registrationAreaCodeAlertView: LGAlertView?
    var loginAreaCodeAlertView: LGAlertView?
    
    var countries: [CountryModel] = []
    var languages: [LanguageModel] = []
    
    var selectedCountry = CountryModel()
    var selectedLanguage = LanguageModel()
    
    var isRegistration: Bool = false
    
    //MARK: -
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCellWithIdentifier(self.headerViewNibName)
        self.registerCellWithIdentifier(self.loginResgisterTableViewCellNibName)
        self.registerCellWithIdentifier(self.logoRegisterTableViewCellNibName)
        self.registerCellWithIdentifier(self.resetPasswordTableViewCellNibName)
        
        self.tableView.tableFooterView = self.footerView()
        self.tableView.separatorColor = .clearColor()
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        let viewTapGesture = UITapGestureRecognizer(target:self, action:"closeKeyboard")
        self.view.addGestureRecognizer(viewTapGesture)
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            
        } else {
            
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //Add Nav Bar
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        
        self.fireGetLanguageData()
        self.initializeDefaultValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    func initializeDefaultValues() {
        var countryEntities: [CountryEntity] = CountryEntity.findAll() as! [CountryEntity]
        let countryEntity: CountryEntity = countryEntities.first!
        
        let basicModel: BasicModel = BasicModel.parseDataFromResponseObjec(StringHelper.convertStringToDictionary(countryEntity.json))
        
        if basicModel.dataAnyObject.isKindOfClass(NSArray) {
            var dictionaries: [NSDictionary] = basicModel.dataAnyObject as! [NSDictionary]
            
            for dictionary in dictionaries {
                let model: CountryModel = CountryModel.parseDataFromDictionary(dictionary)
                if model.isActive {
                    println(model.code)
                    println(SessionManager.selectedCountryCode())
                    if model.code == SessionManager.selectedCountryCode() {
                        self.selectedCountry = model
                        self.selectedLanguage = model.defaultLanguage
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    //MARK: - Util Function
    //Loader function
    func showLoader() {
        if self.hud == nil {
            self.hud = YiHUD.initHud()
        }
        
        self.hud?.showHUDToView(self.view)
        self.view.userInteractionEnabled = false
    }
    
    //Hide loader
    func dismissLoader() {
        self.hud?.hide()
        self.view.userInteractionEnabled = true
    }
    
    //MARK: -
    //MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 2
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let loginHeaderView = tableView.dequeueReusableCellWithIdentifier(self.headerViewNibName) as! LoginHeaderTableViewCell
        loginHeaderView.setBackButtonToClose(isCloseButton)
        loginHeaderView.setTitle(self.pageTitle)
        loginHeaderView.delegate = self
        return loginHeaderView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.headerCellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let logoRegisterTableViewCell: LoginRegisterLogoTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(self.logoRegisterTableViewCellNibName) as! LoginRegisterLogoTableViewCell
            logoRegisterTableViewCell.selectionStyle = .None
            return logoRegisterTableViewCell
        }  else {
            if self.isResetPassword {
                let resetPasswordTableViewCell: ForgotPasswordTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(self.resetPasswordTableViewCellNibName) as! ForgotPasswordTableViewCell
                resetPasswordTableViewCell.delegate = self
                resetPasswordTableViewCell.selectionStyle = .None
                
                resetPasswordTableViewCell.mobileNumberTextField.text = ""
                resetPasswordTableViewCell.passwordTextField.text = ""
                resetPasswordTableViewCell.confirmPasswordTextField.text = ""
                resetPasswordTableViewCell.activationCodeTextField.text = ""
                
                return resetPasswordTableViewCell
            } else {
                let loginRegisterTableViewCell: LoginRegisterTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(self.loginResgisterTableViewCellNibName) as! LoginRegisterTableViewCell
                loginRegisterTableViewCell.delegate = self
                loginRegisterTableViewCell.isLogin = self.isLogin
                loginRegisterTableViewCell.referralCode = self.refferalCode
                loginRegisterTableViewCell.selectedCountry = self.selectedCountry
                loginRegisterTableViewCell.selectedLanguage = self.selectedLanguage
                loginRegisterTableViewCell.selectionStyle = .None
                loginRegisterTableViewCell.collectionView.reloadData()
                return loginRegisterTableViewCell
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.logoCellHeight
        }  else {
            return self.registerCellHeight
        }
    }
    
    
    //MARK: -
    //MARK: - Footer View
    func footerView() -> UIView {
        let footerView: UIView = UIView(frame: CGRectZero)
        return footerView
    }
    
    //MARK: -
    //MARK: - Register Cell With Identifier
    func registerCellWithIdentifier(nibName: String) {
        let nib: UINib = UINib(nibName: nibName, bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: nibName)
    }
    
    //MARK: -
    //MARK: - Get Facebook Access Token
    func getFaceBookAccessToken() -> String {
        var accessToken = FBSDKAccessToken.currentAccessToken().tokenString
        return accessToken
    }
    
    //MARK: -
    //MARK: - Fire Registration GCM
    func fireCreateRegistration(registrationID : String) {
        if(SessionManager.isLoggedIn()){
            let manager: APIManager = APIManager.sharedInstance
            let parameters: NSDictionary = [
                
                "registrationId": "\(registrationID)",
                "access_token"  : SessionManager.accessToken(),
                "deviceType"    : "1"
                ]   as Dictionary<String, String>
            
            let url = APIAtlas.baseUrl + APIAtlas.ACTION_GCM_CREATE
            
            manager.POST(url, parameters: parameters, success: {
                (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
                println("Registration successful!")
                }, failure: {
                    (task: NSURLSessionDataTask!, error: NSError!) in
                    println("Registration unsuccessful!")
            })
        }
    }
    
    //MARK: -
    //MARK: - Success Message
    func showSuccessMessage() {
        if self.isRegistration {
            Toast.displayToastWithMessage( LoginStrings.welcomMessage, duration: 3.0, view: self.view)
        } else{
            Toast.displayToastWithMessage( LoginStrings.successMessage, duration: 3.0, view: self.view)
        }
        
        self.view.userInteractionEnabled = false
        Delay.delayWithDuration(1.0, completionHandler: { (success) -> Void in
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.changeRootToHomeView()
        })
    }
    
    
    //MARK: -
    //MARK: - Fire Login With Email
    func fireLoginWithEmail(email: String, password: String) {
        self.isRegistration = false
        self.showLoader()
        self.loginSessionDataTask = WebServiceManager.fireEmailLoginRequestWithUrl(APIAtlas.loginUrl, emailAddress: email, password: password, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            if successful {
                SessionManager.parseTokensFromResponseObject(responseObject as! NSDictionary)
                self.dismissLoader()
                self.showSuccessMessage()
                self.fireCreateRegistration(SessionManager.gcmToken())
            } else {
                self.dismissLoader()
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        })
    }
    
    //MARK: -
    //MARK: - Fire Login With Contact Number EPOY
    func fireLoginWithContactNumber(contactNo: String, password: String) {
        self.showLoader()
        
        self.loginSessionDataTask = WebServiceManager.fireContactNumberLoginRequestWithUrl(APIAtlas.loginUrlV2, contactNo: contactNo, password: password, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            if successful {
                SessionManager.parseTokensFromResponseObject(responseObject as! NSDictionary)
                self.dismissLoader()
                self.showSuccessMessage()
                self.fireCreateRegistration(SessionManager.gcmToken())
            } else {
                self.dismissLoader()
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        })
    }
    
    //MARK: -
    //MARK: - Fire Login With Contact Number
    func fireGetOTP(contactNumber: String, areaCode: String, type: String, storeType: String) {
        self.showLoader()
        
        WebServiceManager.fireUnauthenticatedOTPRequestWithUrl(APIAtlas.unauthenticateOTP, contactNumber: contactNumber, areaCode: areaCode, type: type, storeType: storeType, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            if successful {
                self.dismissLoader()
                
                if let temp = responseObject as? NSDictionary {
                    if let tempMessage = temp["message"] as? String {
                        Toast.displayToastWithMessage(tempMessage, duration: 1.5, view: self.view)
                    }
                }
                
                if self.isResetPassword {
                    self.tempForgotPasswordCell?.startTimer()
                } else {
                    self.tempSimplifiedRegistrationCell!.startTimer()
                }
            } else {
                self.dismissLoader()
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        })
    }
    
    //MARK: -
    //MARK: - Fire Register User
    func fireRegisterUser(contactNumber: String, password: String, areaCode: String, referralCode: String, verificationCode: String, language: Int) {
        self.showLoader()
        
        WebServiceManager.fireRegisterRequestWithUrl(APIAtlas.registerV2, contactNumber: contactNumber, password: password, areaCode: areaCode, referralCode: referralCode, verificationCode: verificationCode, language: language, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            println(responseObject)
            if successful {
                self.isRegistration = true
                self.dismissLoader()
                let registerModel: RegisterModel = RegisterModel.parseDataFromDictionary(responseObject as! NSDictionary)
                if registerModel.isSuccessful {
                    self.fireLoginWithContactNumber(self.tempSimplifiedRegistrationCell!.mobileNumberTextField.text!, password: self.tempSimplifiedRegistrationCell!.passwordTextField.text)
                } else {
                    Toast.displayToastWithMessage(registerModel.message, duration: 2.0, view: self.view)
                }
            } else {
                self.dismissLoader()
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        })
    }
    
    //MARK: -
    //MARK: - Fire Forgot Password
    func fireForgotPassword(verficationCode: String, newPassword: String, storeType: String) {
        self.showLoader()
        
        WebServiceManager.fireForgotPasswordrRequestWithUrl(APIAtlas.forgotPasswordV2, verficationCode: verficationCode, newPassword: newPassword, storeType: storeType, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            if successful {
                self.dismissLoader()
                Toast.displayToastWithMessage(LoginStrings.successForgotPassword, duration: 1.5, view: self.view)
                
                self.pageTitle = LoginStrings.accountTitle
                self.isResetPassword = false
                self.isCloseButton = true
                var indexPath = NSIndexPath(forRow: 1, inSection: 0)
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
                self.tableView.reloadData()
                
            } else {
                self.dismissLoader()
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        })
    }
    
    //MARK: -
    //MARK: - Fire Facebook With Login
    func fireFacebookLoginWithToken(token: String) {
        self.showLoader()
        let manager: APIManager = APIManager.sharedInstance
        
        let parameters: NSDictionary = [LoginConstants.tokenKey: token, LoginConstants.clientIdKey: Constants.Credentials.clientID(), LoginConstants.clientSecretKey: Constants.Credentials.clientSecret(), LoginConstants.grantTypeKey: Constants.Credentials.grantBuyer]
        
        WebServiceManager.fireSocialMediaLoginFromUrl(APIAtlas.facebookUrl, parameters: parameters) { (successful, responseObject, requestErrorType) -> Void in
            self.dismissLoader()
            if successful {
                let loginModel: LoginModel = LoginModel.parseDataFromDictionary(responseObject as! NSDictionary)
                if loginModel.isSuccessful {
                    SessionManager.parseTokensFromResponseObject(loginModel.dataDictionary)
                    self.showSuccessMessage()
                    self.fireCreateRegistration(SessionManager.gcmToken())
                } else {
                    if let isExisting = loginModel.dataDictionary["isExisting"] as? Bool {
                        UIAlertController.showAlertYesOrNoWithTitle(Constants.Localized.error, message: "\(loginModel.message), do you want to merge your account?", viewController: self, actionHandler: { (isYes) -> Void in
                            if isYes {
                                self.mergeAccount(token)
                            } else {
                                FBSDKLoginManager().logOut()
                            }
                        })
                        
                    } else {
                        FBSDKLoginManager().logOut()
                        Toast.displayToastWithMessage(loginModel.message, view: self.view)
                    }
                }
            } else {
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        }
    }
    
    //MARK: -
    //MARK: - Merge Account
    func mergeAccount(facebookAccessToken: String) {
        self.showLoader()
        let manager: APIManager = APIManager.sharedInstance
        
        let parameters: NSDictionary = [LoginConstants.clientIdKey: Constants.Credentials.clientID(), LoginConstants.clientSecretKey: Constants.Credentials.clientSecret(), LoginConstants.clientSecretKey: Constants.Credentials.grantBuyer, LoginConstants.grantTypeKey: Constants.Credentials.grantBuyer, "token": facebookAccessToken, "accountType": "facebook"]
        
        WebServiceManager.fireSocialMediaLoginFromUrl(APIAtlas.mergeFacebook, parameters: parameters) { (successful, responseObject, requestErrorType) -> Void in
            self.dismissLoader()
            if successful {
                let loginModel: LoginModel = LoginModel.parseDataFromDictionary(responseObject as! NSDictionary)
                if loginModel.isSuccessful {
                    SessionManager.parseTokensFromResponseObject(loginModel.dataDictionary)
                    self.showSuccessMessage()
                    self.fireCreateRegistration(SessionManager.gcmToken())
                } else {
                    FBSDKLoginManager().logOut()
                    Toast.displayToastWithMessage(loginModel.message, view: self.view)
                }

            } else {
                if requestErrorType == .ResponseError {
                    let errorModel: ErrorModel = ErrorModel.parseErrorWithResponce(responseObject as! NSDictionary)
                    Toast.displayToastWithMessage(errorModel.message, duration: 1.5, view: self.view)
                } else if requestErrorType == .PageNotFound {
                    Toast.displayToastWithMessage("Page not found.", duration: 1.5, view: self.view)
                } else if requestErrorType == .NoInternetConnection {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .RequestTimeOut {
                    Toast.displayToastWithMessage(Constants.Localized.noInternetErrorMessage, duration: 1.5, view: self.view)
                } else if requestErrorType == .UnRecognizeError {
                    Toast.displayToastWithMessage(Constants.Localized.error, duration: 1.5, view: self.view)
                } else if requestErrorType == .Cancel {
                    //Do nothing
                }
            }
        }
    }
    
    //MARK: -
    //MARK: - Get Languages
    func fireGetLanguageData() {
        self.showLoader()
        var languageEntities: [LanguageEntity] = LanguageEntity.findAll() as! [LanguageEntity]
        
        if languageEntities.count == 0 {
            self.fireGetLanguageAPICall()
        } else{
            let languageEntity: LanguageEntity = languageEntities.first!
            if NSDate().subractDate(languageEntity.dateUpdated) > 1 {
                self.fireGetLanguageAPICall()
            } else {
                let basicModel: BasicModel = BasicModel.parseDataFromResponseObjec(StringHelper.convertStringToDictionary(languageEntity.json))
                
                if basicModel.dataAnyObject.isKindOfClass(NSArray) {
                    var dictionaries: [NSDictionary] = basicModel.dataAnyObject as! [NSDictionary]
                    
                    for dictionary in dictionaries {
                        let model: LanguageModel = LanguageModel.pareseDataFromResponseObject(dictionary)
                        self.languages.append(model)
                    }
                }
                self.dismissLoader()
            }
        }
    }
    
    func fireGetLanguageAPICall() {
        WebServiceManager.fireGetLanguagesWithUrl(APIAtlas.getLanguages, actionHandler: { (successful, responseObject, requestErrorType) -> Void in
            self.dismissLoader()
            if successful {
                self.saveLanguagesToCoreData(responseObject)
                if let response = responseObject as? NSDictionary {
                    if let data = response["data"] as? NSArray {
                        
                        for obj in data {
                            if let temp = obj as? NSDictionary {
                                self.languages.append(LanguageModel.pareseDataFromResponseObject(temp))
                            }
                        }
                    }
                }
            }
        })
    }
    
    //MARK: -
    //MARK: - Save Countries to Core Data
    func saveLanguagesToCoreData(responseObject: AnyObject) {
        var languageEntities: [LanguageEntity] = LanguageEntity.findAll() as! [LanguageEntity]
        
        if languageEntities.count == 0 {
            let languageEntity: LanguageEntity = LanguageEntity.createEntity() as! LanguageEntity
            languageEntity.json = StringHelper.convertDictionaryToJsonString(responseObject as! NSDictionary) as String
            languageEntity.dateUpdated = NSDate()
            languageEntities.append(languageEntity)
            NSManagedObjectContext.defaultContext().saveToPersistentStoreAndWait()
        } else{
            let languageEntity: LanguageEntity = languageEntities.first!
            if NSDate().subractDate(languageEntity.dateUpdated) > 1 {
                languageEntity.json = StringHelper.convertDictionaryToJsonString(responseObject as! NSDictionary) as String
                languageEntities.append(languageEntity)
                languageEntity.dateUpdated = NSDate()
                NSManagedObjectContext.defaultContext().saveToPersistentStoreAndWait()
            }
        }
    }
}

extension LoginAndRegisterTableViewController: LoginRegisterTableViewCellDelegate {
    
    //MARK: - Login
    //MARK: - Login Functions
    func checkLoginError(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell) -> String {
        var errorMessage: String = ""
        
        if simplifiedLoginCell.isMobileLogin {
            if !simplifiedLoginCell.emailMobileTextField.isNotEmpty() {
                errorMessage = LoginStrings.mobileIsRequired
            } else if !simplifiedLoginCell.passwordTextField.isNotEmpty() {
                errorMessage = LoginStrings.passwordIsRequired
            }
        } else {
            if !simplifiedLoginCell.emailMobileTextField.isNotEmpty() {
                errorMessage = LoginStrings.emailIsRequired
            } else if !simplifiedLoginCell.emailMobileTextField.isValidEmail() {
                errorMessage = LoginStrings.invalidEmail
            } else if !simplifiedLoginCell.passwordTextField.isNotEmpty() {
                errorMessage = LoginStrings.passwordIsRequired
            }
        }
        
        return errorMessage
    }
    
    func loginChecker(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell) {
        self.view.endEditing(true)
        
        var errorMessage: String = self.checkLoginError(simplifiedLoginCell)
        
        if errorMessage != "" {
            Toast.displayToastWithMessage(errorMessage, duration: 1.5, view: self.view)
        } else {
            if simplifiedLoginCell.isMobileLogin {
                self.fireLoginWithContactNumber(simplifiedLoginCell.emailMobileTextField.text, password: simplifiedLoginCell.passwordTextField.text)
            } else {
                self.fireLoginWithEmail(simplifiedLoginCell.emailMobileTextField.text, password: simplifiedLoginCell.passwordTextField.text)
            }
        }
    }
    
    //MARK: - Login Delegates
    func simplifiedLoginCell(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell, textFieldShouldReturn textField: UITextField) {
        if textField == simplifiedLoginCell.emailMobileTextField {
            simplifiedLoginCell.passwordTextField.becomeFirstResponder()
        } else {
            self.loginChecker(simplifiedLoginCell)
        }
    }
    
    func simplifiedLoginCell(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell, didTapFBLogin facebookButton: FBSDKLoginButton) {
        self.fireFacebookLoginWithToken(self.getFaceBookAccessToken())
    }
    
    func simplifiedLoginCell(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell, didTapForgotPassword forgotPasswordButton: UIButton) {
        self.pageTitle = LoginStrings.resetTitle
        self.isResetPassword = true
        self.isCloseButton = false
        var indexPath = NSIndexPath(forRow: 1, inSection: 0)
        self.tempForgotPasswordCell?.seconds = 1
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        self.tableView.reloadData()
    }
    
    func simplifiedLoginCell(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell, didTapSignin signInButton: UIButton) {
        self.loginChecker(simplifiedLoginCell)
    }
    
    func simplifiedLoginCell(simplifiedLoginCell: SimplifiedLoginUICollectionViewCell, didTapAreaCode areaCodeView: UIView) {
        self.tempSimplifiedLoginCell = simplifiedLoginCell
        
        var countryEntities: [CountryEntity] = CountryEntity.findAll() as! [CountryEntity]
        let countryEntity: CountryEntity = countryEntities.first!
        var buttonTitles: [String] = []
        
        let basicModel: BasicModel = BasicModel.parseDataFromResponseObjec(StringHelper.convertStringToDictionary(countryEntity.json))
        
        if basicModel.dataAnyObject.isKindOfClass(NSArray) {
            var dictionaries: [NSDictionary] = basicModel.dataAnyObject as! [NSDictionary]
            
            for dictionary in dictionaries {
                let model: CountryModel = CountryModel.parseDataFromDictionary(dictionary)
                if model.isActive {
                    buttonTitles.append("+\(model.areaCode)")
                    self.countries.append(model)
                }
            }
        }
        
        self.loginAreaCodeAlertView = LGAlertView(title: LoginStrings.selectAreaCode, message: LoginStrings.chooseAreaCode, style: LGAlertViewStyle.ActionSheet, buttonTitles: buttonTitles, cancelButtonTitle: nil, destructiveButtonTitle: nil, actionHandler: nil, cancelHandler: nil, destructiveHandler: nil)
        
        
        self.loginAreaCodeAlertView!.coverColor = UIColor(white: 0.0, alpha: 0.7)
        self.loginAreaCodeAlertView!.layerShadowColor = UIColor(white: 0.0, alpha: 0.3)
        self.loginAreaCodeAlertView!.layerShadowRadius = 4.0
        self.loginAreaCodeAlertView!.layerCornerRadius = 0.0
        self.loginAreaCodeAlertView!.layerBorderWidth = 2.0
        self.loginAreaCodeAlertView!.layerBorderColor = Constants.Colors.appTheme
        self.loginAreaCodeAlertView!.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.loginAreaCodeAlertView!.buttonsHeight = 44.0
        self.loginAreaCodeAlertView!.titleFont = UIFont.boldSystemFontOfSize(18.0)
        self.loginAreaCodeAlertView!.titleTextColor = UIColor.darkGrayColor()
        self.loginAreaCodeAlertView!.messageTextColor = UIColor.lightGrayColor()
        self.loginAreaCodeAlertView!.width = min(self.view.bounds.size.width, self.view.bounds.size.height)
        self.loginAreaCodeAlertView!.offsetVertical = 0.0
        self.loginAreaCodeAlertView!.cancelButtonOffsetY = 0.0
        self.loginAreaCodeAlertView!.titleTextAlignment = .Left
        self.loginAreaCodeAlertView!.messageTextAlignment = .Left
        self.loginAreaCodeAlertView!.destructiveButtonTextAlignment = .Right
        self.loginAreaCodeAlertView!.buttonsTextAlignment = .Right
        self.loginAreaCodeAlertView!.cancelButtonTextAlignment = .Right
        self.loginAreaCodeAlertView!.separatorsColor = nil
        self.loginAreaCodeAlertView!.destructiveButtonTitleColor = UIColor.whiteColor()
        
        self.loginAreaCodeAlertView!.buttonsTitleColor = UIColor.darkGrayColor()
        self.loginAreaCodeAlertView!.cancelButtonTitleColor = UIColor.whiteColor()
        self.loginAreaCodeAlertView!.buttonsTitleColorHighlighted = UIColor.whiteColor()
        
        self.loginAreaCodeAlertView!.destructiveButtonBackgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        self.loginAreaCodeAlertView!.buttonsBackgroundColor = Constants.Colors.alphaAppThemeColor
        self.loginAreaCodeAlertView!.buttonsBackgroundColorHighlighted = Constants.Colors.appTheme
        self.loginAreaCodeAlertView!.cancelButtonBackgroundColorHighlighted = UIColor(white: 0.5, alpha: 1.0)
        self.loginAreaCodeAlertView!.delegate = self
        self.loginAreaCodeAlertView!.showAnimated(true, completionHandler: nil)
    }
    
    
    //MARK: - Registration
    //MARK: - Registration Function
    func checkRegistrationError(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell) -> String {
        var errorMessage: String = ""
        //validate fields
        if simplifiedRegistrationCell.mobileNumberTextField.text == "" {
            errorMessage = RegisterStrings.contactRequired
        } else if !simplifiedRegistrationCell.passwordTextField.isNotEmpty() {
            errorMessage = RegisterStrings.passwordRequired
        } else if simplifiedRegistrationCell.passwordTextField.isNumericOnly() || simplifiedRegistrationCell.passwordTextField.isAphaOnly() {
            errorMessage = RegisterStrings.numbersAndLettersCombination
        } else if !simplifiedRegistrationCell.passwordTextField.isGreaterThanEightCharacters() {
            errorMessage = RegisterStrings.eightCharacters
        } else if !simplifiedRegistrationCell.passwordTextField.isValidPassword() {
            errorMessage = RegisterStrings.numbersAndLettersOnly
        }  else if !simplifiedRegistrationCell.passwordTextField.isAlphaNumeric() {
            errorMessage = RegisterStrings.illegalPassword
        } else if !simplifiedRegistrationCell.confirmPasswordTextField.isNotEmpty() {
            errorMessage = RegisterStrings.reTypePasswordError
        } else if simplifiedRegistrationCell.passwordTextField.text != simplifiedRegistrationCell.confirmPasswordTextField.text {
            errorMessage = RegisterStrings.passwordNotMatch
        } else if simplifiedRegistrationCell.activationCodeTextField.text.isEmpty {
            errorMessage = RegisterStrings.activationCodeRequired
        }
        
        return errorMessage
    }
    
    func registrationChecker(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell) {
        self.view.endEditing(true)
        
        var errorMessage: String = self.checkRegistrationError(simplifiedRegistrationCell)
        
        if errorMessage != "" {
            Toast.displayToastWithMessage(errorMessage, duration: 1.5, view: self.view)
        } else {
            self.fireRegisterUser(simplifiedRegistrationCell.mobileNumberTextField.text, password: simplifiedRegistrationCell.passwordTextField.text, areaCode: self.selectedCountry.areaCode, referralCode: simplifiedRegistrationCell.referralCodeTextField.text, verificationCode: simplifiedRegistrationCell.activationCodeTextField.text, language: self.selectedLanguage.languageId)
        }
    }
    
    //MARK: - Registration Delegate
    func simplifiedRegistrationCell(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell, textFieldShouldReturn textField: UITextField) {
        self.tempSimplifiedRegistrationCell = simplifiedRegistrationCell
    }
    
    func simplifiedRegistrationCell(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell, didTapLanguagePreference languagePreferenceView: UIView) {
        self.tempSimplifiedRegistrationCell = simplifiedRegistrationCell
        var buttonTitles: [String] = []
        
        for language in self.languages {
            buttonTitles.append("\(language.name) (\(language.code.uppercaseString))")
        }
        
        
        self.languageAlertView = LGAlertView(title: LoginStrings.selectLanguage, message: LoginStrings.chooseLanguage, style: LGAlertViewStyle.ActionSheet, buttonTitles: buttonTitles, cancelButtonTitle: nil, destructiveButtonTitle: nil, actionHandler: nil, cancelHandler: nil, destructiveHandler: nil)
        
        self.languageAlertView!.coverColor = UIColor(white: 0.0, alpha: 0.7)
        self.languageAlertView!.layerShadowColor = UIColor(white: 0.0, alpha: 0.3)
        self.languageAlertView!.layerShadowRadius = 4.0
        self.languageAlertView!.layerCornerRadius = 0.0
        self.languageAlertView!.layerBorderWidth = 2.0
        self.languageAlertView!.layerBorderColor = Constants.Colors.appTheme
        self.languageAlertView!.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.languageAlertView!.buttonsHeight = 44.0
        self.languageAlertView!.titleFont = UIFont.boldSystemFontOfSize(18.0)
        self.languageAlertView!.titleTextColor = UIColor.darkGrayColor()
        self.languageAlertView!.messageTextColor = UIColor.lightGrayColor()
        self.languageAlertView!.width = min(self.view.bounds.size.width, self.view.bounds.size.height)
        self.languageAlertView!.offsetVertical = 0.0
        self.languageAlertView!.cancelButtonOffsetY = 0.0
        self.languageAlertView!.titleTextAlignment = .Left
        self.languageAlertView!.messageTextAlignment = .Left
        self.languageAlertView!.destructiveButtonTextAlignment = .Right
        self.languageAlertView!.buttonsTextAlignment = .Right
        self.languageAlertView!.cancelButtonTextAlignment = .Right
        self.languageAlertView!.separatorsColor = nil
        self.languageAlertView!.destructiveButtonTitleColor = UIColor.whiteColor()
        
        self.languageAlertView!.buttonsTitleColor = UIColor.darkGrayColor()
        self.languageAlertView!.cancelButtonTitleColor = UIColor.whiteColor()
        self.languageAlertView!.buttonsTitleColorHighlighted = UIColor.whiteColor()
        
        self.languageAlertView!.destructiveButtonBackgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        self.languageAlertView!.buttonsBackgroundColor = Constants.Colors.alphaAppThemeColor
        self.languageAlertView!.buttonsBackgroundColorHighlighted = Constants.Colors.appTheme
        self.languageAlertView!.cancelButtonBackgroundColorHighlighted = UIColor(white: 0.5, alpha: 1.0)
        self.languageAlertView!.delegate = self
        self.languageAlertView!.showAnimated(true, completionHandler: nil)
        
    }
    
    func simplifiedRegistrationCell(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell, didTapAreaCode areaCodeView: UIView) {
        self.tempSimplifiedRegistrationCell = simplifiedRegistrationCell
        
        var countryEntities: [CountryEntity] = CountryEntity.findAll() as! [CountryEntity]
        let countryEntity: CountryEntity = countryEntities.first!
        var buttonTitles: [String] = []
        
        let basicModel: BasicModel = BasicModel.parseDataFromResponseObjec(StringHelper.convertStringToDictionary(countryEntity.json))
        
        if basicModel.dataAnyObject.isKindOfClass(NSArray) {
            var dictionaries: [NSDictionary] = basicModel.dataAnyObject as! [NSDictionary]
            
            for dictionary in dictionaries {
                let model: CountryModel = CountryModel.parseDataFromDictionary(dictionary)
                if model.isActive {
                    buttonTitles.append("+\(model.areaCode)")
                    self.countries.append(model)
                }
            }
        }
        
        self.registrationAreaCodeAlertView = LGAlertView(title: LoginStrings.selectAreaCode, message: LoginStrings.chooseAreaCode, style: LGAlertViewStyle.ActionSheet, buttonTitles: buttonTitles, cancelButtonTitle: nil, destructiveButtonTitle: nil, actionHandler: nil, cancelHandler: nil, destructiveHandler: nil)
        
        
        self.registrationAreaCodeAlertView!.coverColor = UIColor(white: 0.0, alpha: 0.7)
        self.registrationAreaCodeAlertView!.layerShadowColor = UIColor(white: 0.0, alpha: 0.3)
        self.registrationAreaCodeAlertView!.layerShadowRadius = 4.0
        self.registrationAreaCodeAlertView!.layerCornerRadius = 0.0
        self.registrationAreaCodeAlertView!.layerBorderWidth = 2.0
        self.registrationAreaCodeAlertView!.layerBorderColor = Constants.Colors.appTheme
        self.registrationAreaCodeAlertView!.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.registrationAreaCodeAlertView!.buttonsHeight = 44.0
        self.registrationAreaCodeAlertView!.titleFont = UIFont.boldSystemFontOfSize(18.0)
        self.registrationAreaCodeAlertView!.titleTextColor = UIColor.darkGrayColor()
        self.registrationAreaCodeAlertView!.messageTextColor = UIColor.lightGrayColor()
        self.registrationAreaCodeAlertView!.width = min(self.view.bounds.size.width, self.view.bounds.size.height)
        self.registrationAreaCodeAlertView!.offsetVertical = 0.0
        self.registrationAreaCodeAlertView!.cancelButtonOffsetY = 0.0
        self.registrationAreaCodeAlertView!.titleTextAlignment = .Left
        self.registrationAreaCodeAlertView!.messageTextAlignment = .Left
        self.registrationAreaCodeAlertView!.destructiveButtonTextAlignment = .Right
        self.registrationAreaCodeAlertView!.buttonsTextAlignment = .Right
        self.registrationAreaCodeAlertView!.cancelButtonTextAlignment = .Right
        self.registrationAreaCodeAlertView!.separatorsColor = nil
        self.registrationAreaCodeAlertView!.destructiveButtonTitleColor = UIColor.whiteColor()
        
        self.registrationAreaCodeAlertView!.buttonsTitleColor = UIColor.darkGrayColor()
        self.registrationAreaCodeAlertView!.cancelButtonTitleColor = UIColor.whiteColor()
        self.registrationAreaCodeAlertView!.buttonsTitleColorHighlighted = UIColor.whiteColor()
        
        self.registrationAreaCodeAlertView!.destructiveButtonBackgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        self.registrationAreaCodeAlertView!.buttonsBackgroundColor = Constants.Colors.alphaAppThemeColor
        self.registrationAreaCodeAlertView!.buttonsBackgroundColorHighlighted = Constants.Colors.appTheme
        self.registrationAreaCodeAlertView!.cancelButtonBackgroundColorHighlighted = UIColor(white: 0.5, alpha: 1.0)
        self.registrationAreaCodeAlertView!.delegate = self
        self.registrationAreaCodeAlertView!.showAnimated(true, completionHandler: nil)
        
        
        
    }
    
    func simplifiedRegistrationCell(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell, didTapSendActivationCode sendActivationCodeButton: UIButton) {
        self.closeKeyboard()
        self.tempSimplifiedRegistrationCell = simplifiedRegistrationCell
        if simplifiedRegistrationCell.mobileNumberTextField.isNotEmpty() {
            self.fireGetOTP(simplifiedRegistrationCell.mobileNumberTextField.text, areaCode: self.selectedCountry.areaCode, type: "register", storeType: "")
        } else {
            Toast.displayToastWithMessage(RegisterStrings.contactRequired, duration: 1.5, view: self.view)
        }
    }
    
    func simplifiedRegistrationCell(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell, didTapRegister registerButton: UIButton) {
        self.closeKeyboard()
        self.tempSimplifiedRegistrationCell = simplifiedRegistrationCell
        self.registrationChecker(simplifiedRegistrationCell)
    }
    
    func simplifiedRegistrationCell(simplifiedRegistrationCell: SimplifiedRegistrationUICollectionViewCell, didTimerEnded registerButton: UIButton) {
        self.tempSimplifiedRegistrationCell = simplifiedRegistrationCell
    }
    
    
    //MARK: - Login Register Delegate
    func loginRegisterTableViewCell(loginRegisterTableViewCell: LoginRegisterTableViewCell, didTapSignIn signInButton: UIButton) {
        self.pageTitle = LoginStrings.accountTitle
        self.isResetPassword = false
        self.isCloseButton = true
        var indexPath = NSIndexPath(forRow: 1, inSection: 0)
        self.tableView.reloadData()
    }
    
    func loginRegisterTableViewCell(loginRegisterTableViewCell: LoginRegisterTableViewCell, didTapRegister registerButton: UIButton) {
        self.pageTitle = LoginStrings.registerTitle
        self.isResetPassword = false
        self.isCloseButton = true
        var indexPath = NSIndexPath(forRow: 1, inSection: 0)
        self.tableView.reloadData()
    }
}

extension LoginAndRegisterTableViewController: LoginHeaderTableViewCellDelegate {
    func loginHeaderTableViewCell(loginHeaderTableViewCell: LoginHeaderTableViewCell, didTapBack navBarButton: UIButton) {
        if self.isResetPassword {
            self.pageTitle = LoginStrings.accountTitle
            self.isResetPassword = false
            self.isCloseButton = true
            var indexPath = NSIndexPath(forRow: 1, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
            self.tableView.reloadData()
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

extension LoginAndRegisterTableViewController: ForgotPasswordTableViewCellDelegate {
    
    //MARK: - Forgot Password Function
    func checkForgotPasswordError(forgotPasswordCell: ForgotPasswordTableViewCell) -> String {
        var errorMessage: String = ""
        //validate fields
        if forgotPasswordCell.mobileNumberTextField.text == "" {
            errorMessage = RegisterStrings.contactRequired
        } else if !forgotPasswordCell.passwordTextField.isNotEmpty() {
            errorMessage = RegisterStrings.passwordRequired
        } else if forgotPasswordCell.passwordTextField.isNumericOnly() || forgotPasswordCell.passwordTextField.isAphaOnly() {
            errorMessage = RegisterStrings.numbersAndLettersCombination
        } else if !forgotPasswordCell.passwordTextField.isGreaterThanEightCharacters() {
            errorMessage = RegisterStrings.eightCharacters
        } else if !forgotPasswordCell.passwordTextField.isValidPassword() {
            errorMessage = RegisterStrings.numbersAndLettersOnly
        }  else if !forgotPasswordCell.passwordTextField.isAlphaNumeric() {
            errorMessage = RegisterStrings.illegalPassword
        } else if !forgotPasswordCell.confirmPasswordTextField.isNotEmpty() {
            errorMessage = RegisterStrings.reTypePasswordError
        } else if forgotPasswordCell.passwordTextField.text != forgotPasswordCell.confirmPasswordTextField.text {
            errorMessage = RegisterStrings.passwordNotMatch
        } else if forgotPasswordCell.activationCodeTextField.text.isEmpty {
            errorMessage = RegisterStrings.activationCodeRequired
        }
        
        return errorMessage
    }
    
    func forgotPasswordChecker(forgotPasswordCell: ForgotPasswordTableViewCell) {
        self.view.endEditing(true)
        
        var errorMessage: String = self.checkForgotPasswordError(forgotPasswordCell)
        
        if errorMessage != "" {
            Toast.displayToastWithMessage(errorMessage, duration: 1.5, view: self.view)
        } else {
            self.fireForgotPassword(forgotPasswordCell.activationCodeTextField.text, newPassword: forgotPasswordCell.passwordTextField.text, storeType: "")
        }
    }
    
    //MARK: - Forgot Password Delegate
    
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, textFieldShouldReturn textField: UITextField) {
        self.tempForgotPasswordCell = forgotPasswordTableViewCell
    }
    
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTapAreaCode areaCodeView: UIView) {
        self.tempForgotPasswordCell = forgotPasswordTableViewCell
        self.closeKeyboard()
    }
    
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTapSendActivationCode sendActivationCodeButton: UIButton) {
        self.tempForgotPasswordCell = forgotPasswordTableViewCell
        self.closeKeyboard()
        if forgotPasswordTableViewCell.mobileNumberTextField.isNotEmpty() {
            self.fireGetOTP(forgotPasswordTableViewCell.mobileNumberTextField.text, areaCode: "63", type: "forgot-password", storeType: "")
        } else {
            Toast.displayToastWithMessage(RegisterStrings.contactRequired, duration: 1.5, view: self.view)
        }
    }
    
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTapResetPassword resetPasswordButton: UIButton) {
        self.tempForgotPasswordCell = forgotPasswordTableViewCell
        self.closeKeyboard()
        self.forgotPasswordChecker(forgotPasswordTableViewCell)
    }
    
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTimerEnded sendActivationCodeButton: UIButton) {
        self.tempForgotPasswordCell = forgotPasswordTableViewCell
    }
}

extension LoginAndRegisterTableViewController: LGAlertViewDelegate {
    func alertView(alertView: LGAlertView!, buttonPressedWithTitle title: String!, index: UInt) {
        if alertView == self.languageAlertView {
            self.selectedLanguage = self.languages[Int(index)]
            self.tempSimplifiedRegistrationCell?.languagePreferenceLabel.text = "\(self.selectedLanguage.name) (\(self.selectedLanguage.code.uppercaseString))"
        } else if alertView == self.registrationAreaCodeAlertView {
            self.selectedCountry = self.countries[Int(index)]
            self.tempSimplifiedRegistrationCell?.areaCodeLabel.text = "+\(self.selectedCountry.areaCode)"
            self.tempSimplifiedRegistrationCell?.areaCodeImageView.sd_setImageWithURL(NSURL(string: self.selectedCountry.flag), placeholderImage: UIImage(named: "dummy-placeholder"))
        }  else if alertView == self.loginAreaCodeAlertView {
            self.selectedCountry = self.countries[Int(index)]
            self.tempSimplifiedLoginCell?.areaCodeLabel.text = "+\(self.selectedCountry.areaCode)"
            self.tempSimplifiedLoginCell?.areaCodeImageView.sd_setImageWithURL(NSURL(string: self.selectedCountry.flag), placeholderImage: UIImage(named: "dummy-placeholder"))
        }
    }
}