//
//  NBitcoinTests.swift
//  NBitcoinTests
//
//  Created by Chisanapong Intasae on 21/4/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import XCTest
@testable import NBitcoin



class NBitcoinTests: XCTestCase {
	var calculate: Calculate!

	// set ค่า
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		self.calculate = Calculate()
    }

	// เคลียร์ memory
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		self.calculate = nil
    }

	// การทดสอบ
	func testBasicCalculate() {
		let result = self.calculate.plus(a: 1, b: 2)
		XCTAssert(result == 3)
	}

}
