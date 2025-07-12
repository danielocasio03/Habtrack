//
//  HabitView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/7/25.
//

import Foundation
import UIKit

class HabitView: UIView {
	
	//MARK: - UI Components
	
	private let habitColor: DesignManager.HabitColor
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test Habit Name" // Delete - For Testing. Will use dynamic set text per use
		label.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
		label.textColor = DesignManager.shared.headingTextColor
		return label
	}()
	
	private lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test Habit description: describes my habit" // Delete - For Testing. Will use dynamic set text per use
		label.font = UIFont(name: "AvenirNext-Medium", size: 13)
		label.textColor = DesignManager.shared.headingTextColor.withAlphaComponent(0.80)
		return label
	}()
	
	private lazy var goalTimeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test Habit description: describes my habit" // Delete - For Testing. Will use dynamic set text per use
		label.font = UIFont(name: "AvenirNext-Medium", size: 9)
		label.textColor = DesignManager.shared.headingTextColor.withAlphaComponent(0.80)
		return label
	}()
	
	//MARK: - Init
	
	// Custom Init
	init(color: DesignManager.HabitColor) {
		habitColor = color
		super.init(frame: .zero)
		setupView()
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: - Setup Methods
	
	private func setupView() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = habitColor.color
		layer.cornerRadius = 10
		//Shadow
		layer.shadowRadius = 4 // Fix - Shadow is not being applied
		layer.shadowColor = DesignManager.shared.shadowColor.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.25
		layer.masksToBounds = true
	}
	
	func setupSubviews() {
		addSubview(titleLabel)
		addSubview(subtitleLabel)
		addSubview(goalTimeLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: DesignManager.Spacing.smallMed),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignManager.Spacing.medium),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DesignManager.Spacing.medium),
			
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DesignManager.Spacing.tiny),
			subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			
			goalTimeLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: DesignManager.Spacing.tiny),
			goalTimeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			goalTimeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			goalTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DesignManager.Spacing.smallMed)
			
		])
	}
}
