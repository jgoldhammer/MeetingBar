//
//  MeetingBarTests.swift
//  MeetingBarTests
//
//  Created by Andrii Leitsius on 22.09.2020.
//  Copyright © 2020 Andrii Leitsius. All rights reserved.
//

import XCTest
@testable import MeetingBar

class HelpersTests: XCTestCase {
    func testGetMatch() throws {
        let regex = try! NSRegularExpression(pattern: #"v\d"#)
        var result: String?

        result = getMatch(text: "Lore v2 ipsum", regex: regex)
        XCTAssertEqual(result, "v2")

        result = getMatch(text: "Lore ipsum", regex: regex)
        XCTAssertNil(result)

        result = getMatch(text: "Lore v3 v4 v5 ipsum", regex: regex)
        XCTAssertEqual(result, "v3")
    }

    func testGetRegexForService() throws {
        var result: NSRegularExpression?

        result = getRegexForService(MeetingServices.zoom)
        XCTAssertEqual(result, LinksRegex().zoom)
    }
}
