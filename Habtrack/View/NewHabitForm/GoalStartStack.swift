//
//  GoalStartStack.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/22/25.
//

import Foundation
import UIKit

class GoalStartStack: UIStackView {
	
	// MARK: - UI Components
	
	private lazy var goalLabel = UILabel()
	private lazy var goalButton = configureButton(systemImage: "timer", title: "Time Goal", label: goalLabel)
	private lazy var startDateLabel = UILabel()
	private lazy var startDateButton = configureButton(systemImage: "calendar", title: "Start Date", label: startDateLabel)
	
	private lazy var dividerView: UIView = {
		let view  = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.backgroundColor
		view.heightAnchor.constraint(equalToConstant: 1).isActive = true
		return view
	}()
	
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupStack()
		setupSubviews()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup Methods
	
	private func setupStack() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = DesignManager.shared.containerColor
		layer.cornerRadius = 10
		axis = .vertical
		distribution = .fill
		alignment = .fill
		spacing = DesignManager.Spacing.small
		isLayoutMarginsRelativeArrangement = true
		layoutMargins = UIEdgeInsets (
			top: DesignManager.Spacing.small,
			left: DesignManager.Spacing.smallMed,
			bottom: DesignManager.Spacing.small,
			right: DesignManager.Spacing.smallMed
		)
		
		//shadow
		layer.shadowRadius = 4
		layer.shadowColor = DesignManager.shared.shadowColor.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.25
		layer.masksToBounds = false
	}
	
	private func setupSubviews() {
		addArrangedSubview(goalButton)
		addArrangedSubview(dividerView)
		addArrangedSubview(startDateButton)
	}
	
	
	// MARK: - Utility Methods
	
	/// Creates and returns a form button
	private func configureButton(systemImage: String, title: String, label: UILabel) -> UIButton { // Change - Refactor this, modularize this method
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		
		// Image
		let image = UIImageView(image: UIImage(systemName: systemImage))
		button.addSubview(image)
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = DesignManager.shared.subHeadingTextColor
		image.contentMode = .scaleAspectFit
		
		// titleLabel
		let titleLabel = UILabel()
		button.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = title
		titleLabel.textColor = DesignManager.shared.subHeadingTextColor
		titleLabel.font = UIFont(name: "AvenirNext-Medium", size: 15)
		
		// Chevron
		let chevronIcon = UIImageView(image: UIImage(systemName: "chevron.up.chevron.down"))
		button.addSubview(chevronIcon)
		chevronIcon.translatesAutoresizingMaskIntoConstraints = false
		chevronIcon.tintColor = DesignManager.shared.subHeadingTextColor
		chevronIcon.contentMode = .scaleAspectFit
		
		// value label
		button.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "1 hr 0 min" // Change -  Make a default setting
		label.textColor = DesignManager.shared.headingTextColor
		label.font = UIFont(name: "AvenirNext-Medium", size: 15)

		NSLayoutConstraint.activate([
			// Image
			image.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: DesignManager.Spacing.small),
			image.centerYAnchor.constraint(equalTo: button.centerYAnchor),
			// titleLabel
			titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: DesignManager.Spacing.small),
			titleLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor),
			// chevronIcon
			chevronIcon.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -DesignManager.Spacing.small),
			chevronIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			// userSetLabel
			label.trailingAnchor.constraint(equalTo: chevronIcon.leadingAnchor, constant: -DesignManager.Spacing.standard),
			label.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
		])
		
		return button
	}
	
}
