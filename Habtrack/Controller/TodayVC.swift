//
//  ViewController.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import UIKit
import SkeletonView

class TodayVC: UIViewController {
	
	//MARK: - Subviews and PropertiesÏ
	
	private lazy var todayContentView = TodayContentView()

	
	//MARK: - Init/Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupContentView()
		updateDailyQuote()
		setupHabitTableView()
		
		// Change - This is here temporarily for testing. Will be moved to a method when user habits are loaded from CoreData
		DispatchQueue.main.async {
			self.todayContentView.updateTableViewHeight()
		}
	}
	
	
	//MARK: - Private Setup Methods
	
	private func setupView() {
		view.backgroundColor = DesignManager.shared.backgroundColor
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
	
	private func setupHabitTableView() {
		todayContentView.habitsTableView.delegate = self
		todayContentView.habitsTableView.dataSource = self
		todayContentView.habitsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
	
	//MARK: - Internal Helper Methods
	
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


//MARK: - EXT: TableView

extension TodayVC: UITableViewDelegate, UITableViewDataSource {
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20 // Change - This needs to be dynamic. here for testing purposes
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = todayContentView.habitsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.backgroundColor = .blue
		cell.textLabel?.text = "Test"
		
		return cell
	}
	
	
}

