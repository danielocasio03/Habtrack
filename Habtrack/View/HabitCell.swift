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
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: - Setup Methods
	
	func setupCell() {
		backgroundColor = DesignManager.shared.containerColor // Change - This will have dynamic color scheming in the future
		selectionStyle = .none
		contentView.addSubview(titleLabel)
		contentView.addSubview(subtitleLabel)
		contentView.addSubview(goalTimeLabel)
		
		
		NSLayoutConstraint.activate([
		
		
		])
	}
	
}
