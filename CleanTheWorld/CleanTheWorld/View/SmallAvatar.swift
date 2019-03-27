//
//  SmallAvatar.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/27/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class SmallAvatar: UIImageView {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews(){
		layer.cornerRadius = 20
		layer.borderWidth = 1
		layer.borderColor = #colorLiteral(red: 0.2686672807, green: 0.5709795356, blue: 0.1427664161, alpha: 1)
		self.clipsToBounds = true
		createView()
	}
	
	func createView(){
		let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
		view.backgroundColor = UIColor.clear
		view.layer.borderWidth = 3
		view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		view.layer.cornerRadius = 20
		addSubview(view)
	}
	
}
