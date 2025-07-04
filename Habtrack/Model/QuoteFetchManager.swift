//
//  QuoteFetchManager.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/4/25.
//

import Foundation

class QuoteFetchManager {
	
	//MARK: - Properties
	
	static let shared = QuoteFetchManager() // Shared utility instance
		
	enum FetchError: Error {
		case failedToFormURL(String)
		case failedToDecode(String)
	}
	
	//MARK: - Public Methods
	
	func getDailyQuote() async throws -> DailyQuote {
		// 1. Load Quote from Cache, fetching a new from API on failure
		guard let cachedQuote = loadCachedQuote() else {
			print("Error, fetching for a quote")
			return try await fetchQuoteFromAPI()
		}
		
		// 2. Check if Cache is refreshed for the day; returning cache if so, and fetching from API if not.
		if isCacheCurrent(cachedDate: cachedQuote.cachedDate) {
			print("Returning cached quote")
			return cachedQuote.quote
		} else {
			let quote = try await fetchQuoteFromAPI()
			print("Returning NEW fetched Quote")
			return quote
		}
	}
	
	//MARK: - Private Methods
	
	private func fetchQuoteFromAPI() async throws -> DailyQuote {
		// 1. Create URl
		guard let url = URL(string: "https://zenquotes.io/api/today") else {
			throw FetchError.failedToFormURL("Daily Fetch URL: https://zenquotes.io/api/today#")
		}
		
		// 2. Fetch
		let (data, _) = try await URLSession.shared.data(from: url)
		
		// 3. Decode, cache & Return
		let quotes = try JSONDecoder().decode([DailyQuote].self, from: data)
		guard let quote = quotes.first else {
			throw FetchError.failedToDecode("Failed decoding DailyQuoteModel")
		}
		
		saveQuoteToCache(quote: quote)
		
		return quote
	}
	
	/// Takes a given Daily Quote and caches it for use
	private func saveQuoteToCache(quote: DailyQuote) {
		let cachedQuote = CachedQuote(quote: quote, cachedDate: Date())
		
		do {
			let encodedData = try JSONEncoder().encode(cachedQuote)
			UserDefaults.standard.set(encodedData, forKey: "cachedDailyQuote")
			print("Cached Quote Successfully")
		} catch {
			print("Failed to encode and save quote: \(error)")
		}
	}
	
	/// Loads and returns a quote saved to Cache
	private func loadCachedQuote() -> CachedQuote? {
		guard let data = UserDefaults.standard.data(forKey: "cachedDailyQuote") else {
			return nil
		}
		
		do {
			let cachedQuote = try JSONDecoder().decode(CachedQuote.self, from: data)
			return cachedQuote
		} catch {
			print("Failed to decode cached quote: \(error)")
			return nil
		}
	}
	
	/// Checks if given cache date is current and returns bool
	private func isCacheCurrent(cachedDate: Date) -> Bool {
		let calendar = Calendar.current
		return calendar.isDateInToday(cachedDate)
	}
	
}
