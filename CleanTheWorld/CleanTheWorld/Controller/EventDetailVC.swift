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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tvMembers.delegate = self
		tvMembers.dataSource = self
        // Do any additional setup after loading the view.
    }
	
	override func viewDidLayoutSubviews() {
		scroller.isScrollEnabled = true
		// Do any additional setup after loading the view
		scroller.contentSize = CGSize(width: scroller.contentSize.width, height: scroller.contentSize.height)
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	var arrName = ["John", "Susie", "Sushi", "Tempura", "Nani"]
	var arrImage = ["CoDang", "Rac1", "icon-comment", "icon-location", "icon-member"]
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "MembersCell") as? MembersCell {
			cell.avatar.image = UIImage(named: arrImage[indexPath.row])
			cell.name.text = arrName[indexPath.row]
			return cell
		}
		return MembersCell()
	}
	
	override func viewWillLayoutSubviews() {
		tvMembers.reloadData()
	}
}
