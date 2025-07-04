//
//  DailyQuoteModel.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/4/25.
//

import Foundation

struct DailyQuote: Codable {
	
	let quote: String
	
	let author: String
	
	enum CodingKeys: String, CodingKey {
		case quote = "q"
		case author = "a"
	}
}

struct CachedQuote: Codable {

	let quote: DailyQuote
	
	let cachedDate: Date
	
}
