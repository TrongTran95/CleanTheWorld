//
//  LoginViewController.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/22/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
	@IBOutlet weak var txtUserName: CustomTextField!
	@IBOutlet weak var txtPassword: CustomTextField!
	@IBOutlet weak var cstCenterContainerViewToCenterView: NSLayoutConstraint!
	@IBOutlet weak var viewContainer: UIView!
	@IBOutlet weak var stackViewLogin: UIStackView!
	
	var keyboardHeight: CGFloat!
	var isKeyboardHideTheContent: Bool = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupKeyboard()
	}

	// Hide Keyboard when tapped somewhere on screen
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	// Hide keyboard when hit return
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
		txtUserName.resignFirstResponder()
		txtPassword.resignFirstResponder()
		return true
	}
	
	//Setup keyboard (mainly about hiding keyboard)
	func setupKeyboard() {
		//Delegate to hide keyboard when hit return
		txtUserName.delegate = self
		txtPassword.delegate = self
		//Catch the event when keyboard active and deactive
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(keyboardWillShow(notification:)),
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(keyboardWillHide(notification:)),
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
	}
	
	//When keyboard active, this function will be call
	//Calculate the keyboard height and move the view up
	@objc func keyboardWillShow(notification: Notification){
		if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			self.keyboardHeight = keyboardHeight
		}
		moveViewUp()
	}
	
	//When keyboard deactive
	//move the view down
	@objc func keyboardWillHide(notification: NSNotification?) {
		//if the view is already move up (it's not hide the content)
		if (!isKeyboardHideTheContent) {
			//Move down
			cstCenterContainerViewToCenterView.constant = 0
			UIView.animate(withDuration: 0.5) {
				self.view.layoutIfNeeded()
			}
		}
	}

	//Calculate and move the view up
	func moveViewUp(){
		//endOfSubviewPosition = distance to subview + subview height
		let endOfSubviewPosition = stackViewLogin.frame.origin.y + stackViewLogin.frame.size.height
		let viewContainerHeight = view.frame.size.height
		
		/* Check if keyboard hide the content (subview)
		 _____________
		|            | \
		|  Container |  \ this's the end of subView (a)
		|  _________ |  /
		| |________| | /
		|____________|
		b = keyboard height
		c = container view height
		if (a + b) > c => the keyboard is hiding content
		*/
		isKeyboardHideTheContent = (endOfSubviewPosition + keyboardHeight) > viewContainerHeight ? true : false
		if (isKeyboardHideTheContent){
			//DistanceRemain = c - a
			let distanceRemain = viewContainerHeight - (endOfSubviewPosition + keyboardHeight)
			//Move view container a distance of (distance remain - 20(bonus))
			cstCenterContainerViewToCenterView.constant = distanceRemain - 20
			UIView.animate(withDuration: 0.5) {
				self.view.layoutIfNeeded()
			}
		}
		//Keyboard had moved up
		isKeyboardHideTheContent = false
	}
	
	
	
	//Come back from Sign Up view controller
	@IBAction func unwindFromSignUpVC(unwindSegue: UIStoryboardSegue) {
		
	}
	
}

