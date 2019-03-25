//
//  EventCell.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/24/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
	@IBOutlet weak var imgTrash: UIImageView!
	@IBOutlet weak var lblAddress: UILabel!
	@IBOutlet weak var lblDate: UILabel!
	@IBOutlet weak var lblStatus: UILabel!
	
	func updateViews(event: Event) {
		imgTrash.image = UIImage(named: event.imageName)
		lblAddress.text = event.address
		lblDate.text = event.date
		lblStatus.text = event.getStatus(status: event.status)
		changeStatusColor(status: event.status)
	}
	
	func changeStatusColor(status: StatusType) {
		switch status {
		case .Done, .Full:
			lblStatus.textColor = #colorLiteral(red: 0.267542459, green: 1, blue: 0.261089323, alpha: 1)
		case .OnGoing, .NotFull:
			lblStatus.textColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
			lblStatus.layer.borderColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
		}
	}
}
