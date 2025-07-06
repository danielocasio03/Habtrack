//
//  ViewController.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import UIKit
import SkeletonView

class TodayVC: UIViewController {
	
	//MARK: - Subviews and Properties
	
	private lazy var todayContentView = TodayContentView()

	
	//MARK: - Init/Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupContentView()
		updateDailyQuote()
	}
	
	
	//MARK: - Private Setup Methods
	
	private func setupView() {
		view.backgroundColor = DesignManager.shared.lightBGColor
	}
	
	private func setupContentView() {
		view.addSubview(todayContentView)
		todayContentView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			todayContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			todayContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			todayContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			todayContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
	/// Method to update the fetch for and update the daily quote
	private func updateDailyQuote() {
		todayContentView.dailyInspirationView.showQuoteSkeleton() // 1. Show skeletons
		Task {
			do {
				let quote = try await QuoteFetchManager.shared.getDailyQuote() // 2. Fetch for a quote
				try? await Task.sleep(nanoseconds: 3_000_000_000) // Delete (For testing)
				todayContentView.dailyInspirationView.hideQuoteSkeleton() // 3. Hide Skeleton
				todayContentView.dailyInspirationView.updateQuote(newQuote: quote) // 4. Update Quote with fetched text
			} catch {
				todayContentView.dailyInspirationView.hideQuoteSkeleton()
				todayContentView.dailyInspirationView.updateQuote(newQuote: DailyQuote(quote: "Be still and know that I am God.", author: "Psalm 46:10"))
			}
		}
	}


}

