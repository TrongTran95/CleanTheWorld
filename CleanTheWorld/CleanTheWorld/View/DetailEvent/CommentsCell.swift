//
//  CommentsCell.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 4/3/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class CommentsCell: UITableViewCell {
	@IBOutlet weak var avatar: SmallAvatar!
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var time: UILabel!
	@IBOutlet weak var content: UITextView!
}
