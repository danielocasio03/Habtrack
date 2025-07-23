//
//  CreateNewHabitView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/14/25.
//

import Foundation
import UIKit

class NewHabitFormView: UIView {
	
	// MARK: - UI Components
	
	private lazy var contentView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.backgroundColor = .clear
		return stack
	}()
	
	private lazy var healthyHabitsImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "healthyHabits")
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	// Title and Desc Stackview
	private lazy var titleDescStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.addArrangedSubview(habitTitleField)
		stack.addArrangedSubview(habitDescField)
		stack.layer.cornerRadius = 10
		stack.axis = .vertical
		stack.spacing = 1
		stack.distribution = .fillEqually
		stack.alignment = .center
		stack.backgroundColor = DesignManager.shared.containerColor
		return stack
	}()
	
	private lazy var habitTitleField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.placeholder = "Habit Title"
		field.leftView = UIImageView(image: UIImage(named: "unselectedHome"))
		return field
	}()
	
	private lazy var habitDescField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.placeholder = "Habit Title"
		field.leftView = UIImageView(image: UIImage(named: "unselectedHome"))
		return field
	}()
	
	private lazy var goalStartStack = GoalStartStack()
	
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupContentView()
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup Methods
	
	private func setupContentView() {
		addSubview(contentView)
		
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DesignManager.Spacing.standard),
			contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
	private func setupSubviews() {
		contentView.addArrangedSubview(healthyHabitsImage)
		contentView.addArrangedSubview(titleDescStack)
		contentView.addArrangedSubview(goalStartStack)
		
		NSLayoutConstraint.activate([
			// healthyHabitsImage
			healthyHabitsImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35),
			healthyHabitsImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35),
			healthyHabitsImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			// titleDescStack
			titleDescStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DesignManager.Spacing.standard),
			titleDescStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -DesignManager.Spacing.standard),
			
			// goalStartStack
			goalStartStack.leadingAnchor.constraint(equalTo: titleDescStack.leadingAnchor),
			goalStartStack.trailingAnchor.constraint(equalTo: titleDescStack.trailingAnchor),
		])
	}
		
}
