//
//  HabitStackView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/9/25.
//

import Foundation
import UIKit

class HabitStackView: UIStackView {
	
	//MARK: - Properties
	
	
	//MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupStack()
		addHabitView(HabitView(color: .pastelRed)) // Delete - Temporary for Testing
		addHabitView(HabitView(color: .pastelBlue))
		addHabitView(HabitView(color: .pastelYellow))
		addHabitView(HabitView(color: .pastelGreen))
		addHabitView(HabitView(color: .pastelPurple))
		addHabitView(HabitView(color: .pastelPink))
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: - Private Setup Methods
	
	private func setupStack() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .clear
		axis = .vertical
		distribution = .fillEqually
		alignment = .fill
		spacing = DesignManager.Spacing.large.value
	}
	
	
	//MARK: - Public Methods
	
	/// Adds a new habitView to the stack
	public func addHabitView(_ habitView: HabitView) {
		addArrangedSubview(habitView)
	}
	
	/// Remove's the given habitView from the stack
	public func removeHabitView() { // Change - Should take in a instance of HabitView to remove
		
	}
	
	/// Removed all habitView's from the stack
	public func clearAllHabits() {
		
	}
	
}
