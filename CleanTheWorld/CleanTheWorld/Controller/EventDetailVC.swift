//
//  EventDetailVC.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/25/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class EventDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	

	@IBOutlet weak var scroller: UIScrollView!
	@IBOutlet weak var tvMembers: UITableView!
	@IBOutlet weak var cstDescriptionViewHeight: NSLayoutConstraint!
	
	@IBOutlet weak var cstCommentsTableViewHeight: NSLayoutConstraint!
	@IBOutlet weak var descriptionView: DescriptionView!
	@IBOutlet weak var tvComments: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()
		tvMembers.delegate = self
		tvMembers.dataSource = self
		tvComments.delegate = self
		tvComments.dataSource = self
		
    }
	@IBAction func abc(_ sender: Any) {
		cstDescriptionViewHeight.constant = 0
		descriptionView.isHidden = true
		view.layoutIfNeeded()
	}
	
	override func viewDidLayoutSubviews() {
		scroller.isScrollEnabled = true
		// Do any additional setup after loading the view
		scroller.contentSize = CGSize(width: scroller.contentSize.width, height: scroller.contentSize.height)
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if (tableView == tvMembers) {
			return 5
		} else {
			return 10
		}
	}
	
	var arrName = ["John", "Susie", "Sushi", "Tempura", "Nani"]
	var arrImage = ["CoDang", "Rac1", "icon-comment", "icon-location", "icon-member"]
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "MembersCell") as? MembersCell {
			cell.avatar.image = UIImage(named: arrImage[indexPath.row])
			cell.name.text = arrName[indexPath.row]
			return cell
		} else if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell") as? CommentsCell {
			
			return cell
		}
		return UITableViewCell()
	}
	var count:CGFloat = 0
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	override func viewWillLayoutSubviews() {
		//Change comments table view height constant
		for cell in tvComments.visibleCells {
			count += cell.bounds.height
		}
		cstCommentsTableViewHeight.constant = count
		view.layoutIfNeeded()
	}
}
