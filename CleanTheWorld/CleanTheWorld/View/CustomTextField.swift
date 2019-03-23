//
//  CustomTextField.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/22/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
	override func awakeFromNib() {
		super.awakeFromNib()
		self.borderStyle = .line
		layer.borderWidth = 2.0
		layer.borderColor = UIColor.white.cgColor
		layer.cornerRadius = 20
		self.clipsToBounds = true
	}
}
