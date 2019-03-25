//
//  PostImage.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/25/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class PostImage: UIImageView {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews() {
//		let view = UIView(frame: CGRect(x: 2, y: 2, width: frame.size.width - 4, height: frame.size.height - 4))
//		view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//		view.layer.cornerRadius = 15
//		addSubview(view)
		layer.cornerRadius = 15
//		layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//		layer.borderWidth = 2
	}
}
