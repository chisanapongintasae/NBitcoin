//
//  NewsBitcoin.swift
//  NBitcoin
//
//  Created by Chisanapong Intasae on 27/3/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import Foundation
import ObjectMapper


struct NewsItem: Mappable {
	var articles: [Articles] = []    // results have many array Result -> [Result]
	init?(map: Map) {
	}

	mutating func mapping(map: Map) {
		self.articles <- map ["articles"]
	}
}

struct Articles: Mappable {
	var author: String = ""
	var title: String = ""
	var description: String = ""
	var url: String? = ""
	
	init?(map: Map) {
	}
	
	mutating func mapping(map: Map) {
		self.author       <- map["author"]
		self.title        <- map["title"]
		self.description  <- map["description"]
		self.url          <- map["urlToImage"]
	
	}
}
