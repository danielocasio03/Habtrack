//
//  TodayContentView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/3/25.
//

import Foundation
import UIKit

// Scrollable Container for Today screen - includes dailyInspirationView (quote) and the habits list
class TodayContentView: UIView {
	
	//MARK: - Subviews & Properties
	
	let dailyInspirationView = DailyInspirationView()
	
	lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsHorizontalScrollIndicator = false
//		scrollView.backgroundColor = .red  // Delete after Tests
		return scrollView
	}()
	
	lazy var contentView: UIView = {
		let contentView = UIView()
		contentView.translatesAutoresizingMaskIntoConstraints = false
//		contentView.backgroundColor = .green // Delete after Tests
		return contentView
	}()

	
	//MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupScrollView()
		setupContentView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Setup Methods
	
	func setupScrollView() {
		self.addSubview(scrollView)
		scrollView.addSubview(contentView)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
		])
	}
	
	func setupContentView() {
		contentView.addSubview(dailyInspirationView)
		dailyInspirationView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			dailyInspirationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			dailyInspirationView.heightAnchor.constraint(equalToConstant: 165), // Fix to make dynamic height
			dailyInspirationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			dailyInspirationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			dailyInspirationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

		])
	}
	
}
