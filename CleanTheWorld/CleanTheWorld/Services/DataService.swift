//
//  DataService.swift
//  CleanTheWorld
//
//  Created by Trong Tran on 3/24/19.
//  Copyright © 2019 Trong Tran. All rights reserved.
//

import Foundation

class DataService {
	static public let instance = DataService()
	
	let arrEvent = [
		Event(title: "Test1", imageName: "Rac1", address: "111 duong 37 quan 7 phuong tan quy thanh pho ho chi minh", status: .NotFull(5, 11), date: "11/11/2019"),
		Event(title: "Test2", imageName: "Rac2", address: "38b hoang hoa tham quan thu duc phuong 4 ho chi minh", status: .Full(12, 12), date: "18/12/2019"),
		Event(title: "Test3", imageName: "Rac3", address: "hem 195/128 hoang quoc viet quan thu duc phuong tan thuan tay viet nam", status: .Done, date: "19/12/2019"),
		Event(title: "Test4", imageName: "Rac4", address: "Ho con rua quan 1 phuong 4 ho chi minh", status: .OnGoing, date: "29/12/2019")
	]
	
	func getEvent() -> [Event] {
		return arrEvent
	}
}
