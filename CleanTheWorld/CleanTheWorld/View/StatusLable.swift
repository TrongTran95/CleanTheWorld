//
//  StatusLable.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/24/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class StatusLable: UILabel {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews(){
		layer.borderWidth = 1
		layer.borderColor = #colorLiteral(red: 0.267542459, green: 1, blue: 0.261089323, alpha: 1)
		layer.cornerRadius = 10
	}
	
}
