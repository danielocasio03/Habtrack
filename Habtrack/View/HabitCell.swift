//
//  HabitCell.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/7/25.
//

import Foundation
import UIKit

class HabitCell: UITableViewCell {
	
	
	//MARK: - Properties
	
	static let identifier = "habitCell"
	
	
	//MARK: - UI Components
	
	private lazy var container: UIView = {
		let container = UIView()
		container.translatesAutoresizingMaskIntoConstraints = false
		container.backgroundColor = DesignManager.shared.accentTextColor  // Change - This will have dynamic color scheming in the future
		container.layer.cornerRadius = 10
		//Shadow
		container.layer.shadowRadius = 4 // Fix - Shadow is not being applied
		container.layer.shadowColor = DesignManager.shared.shadowColor.cgColor
		container.layer.shadowOffset = CGSize(width: 0, height: 1)
		container.layer.shadowOpacity = 0.25
		container.layer.masksToBounds = true
		return container
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test Habit Name" // Delete - Will use dynamic set text per use
		label.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
		label.textColor = DesignManager.shared.headingTextColor
		return label
	}()
	
	private lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test Habit description: describes my habit" // Delete - Will use dynamic set text per use
		label.font = UIFont(name: "AvenirNext-Medium", size: 13)
		label.textColor = DesignManager.shared.headingTextColor.withAlphaComponent(0.80)
		return label
	}()
	
	private lazy var goalTimeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test Habit description: describes my habit" // Delete - Will use dynamic set text per use
		label.font = UIFont(name: "AvenirNext-Medium", size: 9)
		label.textColor = DesignManager.shared.headingTextColor.withAlphaComponent(0.80)
		return label
	}()
	
	
	//MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: - Setup Methods
	
	func setupCell() {
		backgroundColor = .clear
		selectionStyle = .none
		contentView.addSubview(container)
		container.addSubview(titleLabel)
		container.addSubview(subtitleLabel)
		container.addSubview(goalTimeLabel)
		
		
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DesignManager.Spacing.smallMed.value),
			container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -DesignManager.Spacing.smallMed.value),
			container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DesignManager.Spacing.standard.value),
			container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -DesignManager.Spacing.standard.value),
			container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: DesignManager.Spacing.smallMed.value),
			titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: DesignManager.Spacing.medium.value),
			titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -DesignManager.Spacing.medium.value),
			
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DesignManager.Spacing.tiny.value),
			subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			
			goalTimeLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: DesignManager.Spacing.tiny.value),
			goalTimeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			goalTimeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			goalTimeLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -DesignManager.Spacing.smallMed.value)
		
		])
	}
	
}
