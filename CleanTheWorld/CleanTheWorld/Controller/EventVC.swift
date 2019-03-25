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
	@IBOutlet weak var lblFilterLocation: UILabel!
	@IBOutlet weak var lblFilterProcessMember: UILabel!
	
	private(set) public var filterLocation: String!
	private(set) public var filterProcess: String!
	private(set) public var filterMembers: String!
	private(set) public var filterContent: String!
	
	let dicLocation = [0:"Near me", 1:"Ho Chi Minh", 2: "Ha Noi", 3: ""]
	let dicProcess = [0:"Not started yet", 1:"Completed"]
	let dicMembers = [0:"Need more members", 1:"Full"]
	
	//currentFilterIndex: store the old index of UISegments in case Cancel button tapped
	private(set) public var currentFilterIndex: [Int]!
	//tempFilterIndex: store the new index of UISegments
	private(set) public var tempFilterIndex: [Int]!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		//Set up data for event table view
		tbEvent.delegate = self
		tbEvent.dataSource = self
		//Set up stuffs for filter view
		setUpGesture()
		setUpFilterContent()
	}
	
	// MARK: - Filter
	
	//Set up Filter content
	func setUpFilterContent(){
		filterLocation = dicLocation[0]
		filterProcess = dicProcess[0]
		filterMembers = dicMembers[0]
		tempFilterIndex = [0, 0, 0]
		currentFilterIndex = [0, 0, 0]
	}
	
	//Action when UISegment's value change
	@IBAction func filterSegmentChanged(_ sender: UISegmentedControl) {
		//Selected segment index
		let index = sender.selectedSegmentIndex
		//Determine which segment has been chose
		switch sender.numberOfSegments {
		//Location segment
		case 4:
			filterLocation = dicLocation[index]!
			tempFilterIndex[0] = index
		//Process or Member segment
		default:
			let title = sender.titleForSegment(at: index)
			//Not started yet & Completed
			if title == dicProcess[0] || title == dicProcess[1]{
				filterProcess = title
				tempFilterIndex[1] = index
				//"Not started yet" segment
				if (title == dicProcess[0]) {
					//Set old filterMembers content after being removed when we choose "Completed" segment
					filterMembers = dicMembers[currentFilterIndex[2]]
					self.smMembers.isEnabled = true
				}
				//"Completed" segment ~> disable member segment
				else {
					filterMembers = ""
					self.smMembers.isEnabled = false
				}
			}
			//Need more members & Full
			else {
				tempFilterIndex[2] = index
				filterMembers = title
			}
		}
	}
	
	//Filter navigation item button tapped (show and hide filter container view
	@IBAction func filterTapped(_ sender: Any) {
		view.layoutIfNeeded()
		if (filterViewContainer.isHidden == true) {
			showFilterView()
		} else {
			reverseSelectedSegments()
			hideFilterView()
		}
	}
	
	//Cancel or Filter button in Filter View tapped
	@IBAction func buttonInFilterViewTapped(_ sender: UIButton) {
		//Filter button tapped
		if (sender.titleLabel!.text == "Filter") {
			//Set label location
			lblFilterLocation.text = filterLocation
			//Set label Process and member
			if (filterMembers != ""){
				lblFilterProcessMember.text = "\(filterProcess!), \(filterMembers!)"
			}
			else {
				lblFilterProcessMember.text = filterProcess!
			}
			//Update segments filter index
			currentFilterIndex = tempFilterIndex
			
		}
		//Cancel button tapped
		else {
			reverseSelectedSegments()
		}
		hideFilterView()
	}
	
	//When we turn off Filter container view without clicked Filter button
	func reverseSelectedSegments(){
		//Set old data before we make change
		smLocation.selectedSegmentIndex = currentFilterIndex[0]
		smProcess.selectedSegmentIndex = currentFilterIndex[1]
		smMembers.selectedSegmentIndex = currentFilterIndex[2]
		//If smMember is disable, enable it
		if (smProcess.selectedSegmentIndex == 0) {
			smMembers.isEnabled = true
		}
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
		}
	}
	
	// MARK: - Gesture
	//Set up gesture for Filter Container View
	func setUpGesture(){
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizer))
		tapGestureRecognizer.numberOfTapsRequired = 1
		tapGestureRecognizer.delegate = self
		filterViewContainer.addGestureRecognizer(tapGestureRecognizer)
	}
	
	//Determine if clicked FilterContainerView or not
	func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
		//If clicked FilterContainerView
		if (touch.view == gestureRecognizer.view){
			reverseSelectedSegments()
			hideFilterView()
			return false
		}
		//If clicked subviews
		return true
	}
	
	// MARK: - Table View
	
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
