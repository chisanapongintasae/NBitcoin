//
//  NewsBitcoinService.swift
//  NBitcoin
//
//  Created by Chisanapong Intasae on 27/3/2563 BE.
//  Copyright © 2563 Chisanapong. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

fileprivate let urlAPI = "https://newsapi.org/v2/everything?q=bitcoin&sortBy=publishedAt&apiKey=698d881487784f158230814684ffcfa6"

class NewbitcoinService {
	
	// func Get API get callback come back
	func fetchNewsBitcoin(completion: @escaping (NewsItem?) -> () ) {
		// Comvert type urlAPI -> type URL Add in url
		guard let url = URL(string: urlAPI) else {
			completion(nil)
			return
		}
		// Getting started API send url, method:get, parameter
		Alamofire.request(url,
								method: .get,
								parameters: nil)
			.validate()
			// Get response is JsonObject
			.responseJSON { response in
				// Check respones ? if get to return
				guard response.result.isSuccess else {
					completion(nil)
					return
				}
				
				// Mapper JsonObject in model come back in result
				let newsItem = Mapper<NewsItem>().map(JSONObject: response.value)
				completion(newsItem)
		}
	}
	
}
