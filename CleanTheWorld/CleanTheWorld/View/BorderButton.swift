//
//  BorderButton.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/22/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
	override func awakeFromNib() {
		super.awakeFromNib()
		layer.borderColor = UIColor.white.cgColor
		layer.borderWidth = 2.0
		layer.cornerRadius = 20
	}
}
