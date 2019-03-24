//
//  Event.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/24/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import Foundation

struct Event {
	private(set) public var title: String
	private(set) public var imageName: String
	private(set) public var address: String
	private(set) public var status: StatusType
	private(set) public var date: String
	
	init(title: String, imageName: String, address: String, status: StatusType, date: String) {
		self.title = title
		self.imageName = imageName
		self.address = address
		self.status = status
		self.date = date
	}
	
	func getStatus(status: StatusType) -> String{
		switch status {
		case .Done:
			return "Done"
		case .OnGoing:
			return "On Going"
		case let .Full(currentNoOfMember, limitNoOfMember):
			return "\(currentNoOfMember)/\(limitNoOfMember)"
		case let .NotFull(currentNoOfMember, limitNoOfMember):
			return "\(currentNoOfMember)/\(limitNoOfMember)"
		}
	}
}
