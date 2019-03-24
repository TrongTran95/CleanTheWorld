//
//  RoundButton.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/24/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews(){
		layer.cornerRadius = 20
	}
}
