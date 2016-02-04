//
//  ForgotPasswordTableViewCell.swift
//  YiLinkerOnlineBuyer
//
//  Created by John Paul Chan on 2/3/16.
//  Copyright (c) 2016 yiLinker-online-buyer. All rights reserved.
//

import UIKit

protocol ForgotPasswordTableViewCellDelegate {
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, textFieldShouldReturn textField: UITextField)
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTapAreaCode areaCodeView: UIView)
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTapSendActivationCode sendActivationCodeButton: UIButton)
    func forgotPasswordTableViewCell(forgotPasswordTableViewCell: ForgotPasswordTableViewCell, didTapResetPassword resetPasswordButton: UIButton)
}

class ForgotPasswordTableViewCell: UITableViewCell {
    
    var delegate: ForgotPasswordTableViewCellDelegate?
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var activationCodeTextField: UITextField!
    
    @IBOutlet weak var areaCodeView: UIView!
    @IBOutlet weak var areaCodeLabel: UILabel!
    
    @IBOutlet weak var sendActivationCodeButton: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    @IBOutlet weak var downImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.initializeViews()
        
        let viewTapGesture = UITapGestureRecognizer(target:self, action:"didTapAreaCode")
        self.areaCodeView.addGestureRecognizer(viewTapGesture)
    }
    
    func initializeViews() {
        self.mobileNumberTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
        self.activationCodeTextField.delegate = self
        
        self.resetPasswordButton.layer.cornerRadius = 3
        
        self.downImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        
        //Set inset of textfield
        self.mobileNumberTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        self.passwordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        self.confirmPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        self.activationCodeTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        
        //Set border attributes
        self.mobileNumberTextField.layer.borderColor = Constants.Colors.backgroundGray.CGColor
        self.passwordTextField.layer.borderColor = Constants.Colors.backgroundGray.CGColor
        self.confirmPasswordTextField.layer.borderColor = Constants.Colors.backgroundGray.CGColor
        self.activationCodeTextField.layer.borderColor = Constants.Colors.backgroundGray.CGColor
        self.areaCodeView.layer.borderColor = Constants.Colors.backgroundGray.CGColor
        
        self.mobileNumberTextField.layer.borderWidth = 1
        self.passwordTextField.layer.borderWidth = 1
        self.confirmPasswordTextField.layer.borderWidth = 1
        self.activationCodeTextField.layer.borderWidth = 1
        self.areaCodeView.layer.borderWidth = 1
        
        //Set placeholder
    }
    
    func didTapAreaCode() {
        self.delegate?.forgotPasswordTableViewCell(self, didTapAreaCode: self.areaCodeView)
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        if sender == self.sendActivationCodeButton {
            self.delegate?.forgotPasswordTableViewCell(self, didTapSendActivationCode: sender)
        } else if sender == self.resetPasswordButton {
            self.delegate?.forgotPasswordTableViewCell(self, didTapResetPassword: sender)
        }
    }
}

//MARK: -
//MARK: - TextField Delegate
extension ForgotPasswordTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.delegate?.forgotPasswordTableViewCell(self, textFieldShouldReturn: textField)
        return true
    }
}