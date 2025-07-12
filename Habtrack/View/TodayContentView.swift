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
	
	let habitsStack = HabitStackView()
		
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsHorizontalScrollIndicator = false
		return scrollView
	}()
	
	private lazy var contentView: UIView = {
		let contentView = UIView()
		contentView.translatesAutoresizingMaskIntoConstraints = false
		return contentView
	}()
	
	private lazy var titleView: ScreenTitleView = {
		let view = ScreenTitleView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var habitsSectionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Today's Habits"
		label.textColor = DesignManager.shared.headingTextColor.withAlphaComponent(0.90)
		label.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
		return label
	}()

	
	//MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupScrollView()
		setupContentView()
	}
	
	required init?(coder: NSCoder) {
		super.init(frame: .zero)
		setupScrollView()
		setupContentView()
	}
	
	//MARK: - Private Setup Methods
	
	private func setupScrollView() {
		self.addSubview(scrollView)
		scrollView.addSubview(contentView)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
		])
	}
	
	private func setupContentView() {
		contentView.addSubview(dailyInspirationView)
		contentView.addSubview(titleView)
		contentView.addSubview(habitsSectionLabel)
		contentView.addSubview(habitsStack)
		dailyInspirationView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			titleView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
			titleView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
			titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			dailyInspirationView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: DesignManager.Spacing.large),
			dailyInspirationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DesignManager.Spacing.standard),
			dailyInspirationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -DesignManager.Spacing.standard),
			habitsSectionLabel.topAnchor.constraint(equalTo: dailyInspirationView.bottomAnchor, constant: DesignManager.Spacing.xxLarge),
			habitsSectionLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: DesignManager.Spacing.standard),
			habitsStack.topAnchor.constraint(equalTo: habitsSectionLabel.bottomAnchor, constant: DesignManager.Spacing.standard),
			habitsStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: DesignManager.Spacing.standard),
			habitsStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -DesignManager.Spacing.standard),
			habitsStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
		])
	}
	
}
