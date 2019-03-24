//
//  BorderButton.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/22/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class BorderButton: UIButton {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews(){
		layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		layer.borderWidth = 2.0
		layer.cornerRadius = 20
	}
}
