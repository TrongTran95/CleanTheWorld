//
//  DescriptionView.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 4/3/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class DescriptionView: UIView {

	@IBOutlet var contentView: UIView!
	@IBOutlet weak var lblDescription: UILabel!
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit(){
		Bundle.main.loadNibNamed("DescriptionView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
	}
	
	

}
