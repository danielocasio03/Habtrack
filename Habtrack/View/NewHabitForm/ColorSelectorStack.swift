//
//  ColorSelectorStack.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/29/25.
//

import Foundation
import UIKit

class ColorSelectorStack: UIStackView {
	
	// MARK: - Properties
	
	let colors: [DesignManager.HabitColor] = [
		.pastelRed, .pastelBlue, .pastelYellow, .pastelGreen,
		.pastelPurple, .pastelPink, .pastelTeal, .pastelOrange
		]
	
	// MARK: - Init/Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupStack()
		createColorButtons()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup Methods
	
	private func setupStack() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = DesignManager.shared.containerColor
		layer.cornerRadius = 13
		alignment = .center
		distribution = .equalCentering
		axis = .horizontal
		isLayoutMarginsRelativeArrangement = true
		layoutMargins = UIEdgeInsets (
			top: DesignManager.Spacing.medium,
			left: DesignManager.Spacing.medium,
			bottom: DesignManager.Spacing.medium,
			right: DesignManager.Spacing.medium)
		
	}
	
	private func createColorButtons() {
		for colorOptions in colors {
			let button = createColorButton(with: colorOptions.color)
			button.widthAnchor.constraint(equalToConstant: 26).isActive = true
			button.heightAnchor.constraint(equalToConstant: 26).isActive = true
			addArrangedSubview(button)
		}
	}
	
	
	// MARK: - Utility & Action methods
	
	private func createColorButton(with color: UIColor) -> UIButton {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = color
		button.layer.cornerRadius = 13
		button.addTarget(self, action: #selector(colorTapped), for: .touchUpInside)
		return button
	}
	
	@objc func colorTapped(_ sender: UIButton) {
		print(sender)
	}
	
}
