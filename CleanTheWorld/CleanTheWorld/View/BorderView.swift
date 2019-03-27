//
//  BorderView.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/27/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class BorderView: UIView {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews(){
		layer.borderColor = #colorLiteral(red: 0.2686672807, green: 0.5709795356, blue: 0.1427664161, alpha: 1)
		layer.borderWidth = 1
		layer.cornerRadius = 17
	}
}
