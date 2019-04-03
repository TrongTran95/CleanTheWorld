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
		let height = frame.size.height
		print(frame.size.height)
		layer.cornerRadius = height/2
		layer.borderWidth = 1
		layer.borderColor = #colorLiteral(red: 0.2686672807, green: 0.5709795356, blue: 0.1427664161, alpha: 1)
		self.clipsToBounds = true
		createView()
	}
	
	func createView(){
		let height = frame.size.height
		let view = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
		view.backgroundColor = UIColor.clear
		view.layer.borderWidth = 3
		view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		view.layer.cornerRadius = height/2
		addSubview(view)
	}
	
}
