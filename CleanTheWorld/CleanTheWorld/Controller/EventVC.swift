//
//  EventVC.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/24/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import UIKit

class EventVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
	
	@IBOutlet weak var tbEvent: UITableView!
	@IBOutlet weak var filterViewContainer: UIView!
	@IBOutlet weak var filterView: UIView!
	@IBOutlet weak var smLocation: UISegmentedControl!
	@IBOutlet weak var smProcess: UISegmentedControl!
	@IBOutlet weak var smMembers: UISegmentedControl!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tbEvent.delegate = self
		tbEvent.dataSource = self
		setUpGesture()
    }
	
	func setUpGesture(){
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizer))
		tapGestureRecognizer.numberOfTapsRequired = 1
		tapGestureRecognizer.delegate = self
		filterViewContainer.addGestureRecognizer(tapGestureRecognizer)
	}
	
	@IBAction func filterTapped(_ sender: Any) {
		view.layoutIfNeeded()
		if (filterViewContainer.isHidden == true) {
			showFilterView()
		} else {
			hideFilterView()
		}
	}
	
	@IBAction func cancelFilterTapped(_ sender: Any) {
		hideFilterView()
	}
	
	func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
		if (touch.view == gestureRecognizer.view){
			hideFilterView()
			return false
		}
		return true
	}
	
	func showFilterView(){
		filterViewContainer.isHidden = false
		UIView.animate(withDuration: 0.5) {
			self.filterViewContainer.alpha = 1
		}
	}
	
	func hideFilterView(){
		UIView.animate(withDuration: 0.5, animations: {
			self.filterViewContainer.alpha = 0
		}) { (finished) in
			self.filterViewContainer.isHidden = true
			self.smLocation.selectedSegmentIndex = 0
			self.smProcess.selectedSegmentIndex = 0
			self.smMembers.selectedSegmentIndex = 0
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DataService.instance.getEvent().count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventCell {
			let event = DataService.instance.getEvent()[indexPath.row]
			cell.updateViews(event: event)
			return cell
		}
		return EventCell()
	}

}
