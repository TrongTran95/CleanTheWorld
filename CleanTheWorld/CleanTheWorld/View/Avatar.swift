//
//  Avatar.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/25/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

@IBDesignable
class Avatar: UIView {
	
	override func prepareForInterfaceBuilder() {
		updateViews()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		updateViews()
	}
	
	func updateViews(){
		layer.cornerRadius = 30
		layer.borderWidth = 2
		layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
		self.clipsToBounds = true
		updateImage(imageName: "CoDang")
	}
	
	func updateImage(imageName: String){
		let image = UIImageView(frame: CGRect(x: 5, y: 5, width: frame.size.width - 10, height: frame.size.height - 10))
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		image.image = UIImage(named: imageName)
		image.layer.cornerRadius = 25
		addSubview(image)
	}
}
