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
	
	private lazy var contentViewStack: UIStackView = {
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
	
	private lazy var addHabitButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = DesignManager.shared.accentColor
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(addHabitTapped), for: .touchUpInside)
		let attributedTitle = NSAttributedString (
			string: "Add New Habit",
			attributes: [ .font: UIFont(name: "AvenirNext-Bold", size: 19) ?? UIFont.systemFont(ofSize: 19) ])
		button.setAttributedTitle(attributedTitle, for: .normal)
		return button
	}()
	
	private lazy var titleDescStack = TitleDescStack()
	private lazy var goalStartStack = GoalStartStack()
	private lazy var pomoStack = PomoStack()
	private lazy var colorSelectorStack = ColorSelectorStack()
	
	
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
		addSubview(contentViewStack)
		
		NSLayoutConstraint.activate([
			contentViewStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DesignManager.Spacing.standard),
			contentViewStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -DesignManager.Spacing.small),
			contentViewStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			contentViewStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
	private func setupSubviews() {
		contentViewStack.addArrangedSubview(healthyHabitsImage)
		contentViewStack.addArrangedSubview(titleDescStack)
		contentViewStack.addArrangedSubview(goalStartStack)
		contentViewStack.addArrangedSubview(pomoStack)
		contentViewStack.addArrangedSubview(colorSelectorStack)
		contentViewStack.addArrangedSubview(addHabitButton)
		
		NSLayoutConstraint.activate([
			// healthyHabitsImage
			healthyHabitsImage.widthAnchor.constraint(equalTo: contentViewStack.widthAnchor, multiplier: 0.35),
			healthyHabitsImage.heightAnchor.constraint(equalTo: contentViewStack.widthAnchor, multiplier: 0.35),
			healthyHabitsImage.centerXAnchor.constraint(equalTo: contentViewStack.centerXAnchor),
			
			// titleDescStack
			titleDescStack.leadingAnchor.constraint(equalTo: contentViewStack.leadingAnchor, constant: DesignManager.Spacing.standard),
			titleDescStack.trailingAnchor.constraint(equalTo: contentViewStack.trailingAnchor, constant: -DesignManager.Spacing.standard),
			
			// goalStartStack
			goalStartStack.leadingAnchor.constraint(equalTo: titleDescStack.leadingAnchor),
			goalStartStack.trailingAnchor.constraint(equalTo: titleDescStack.trailingAnchor),
			
			// pomoStack
			pomoStack.leadingAnchor.constraint(equalTo: titleDescStack.leadingAnchor),
			pomoStack.trailingAnchor.constraint(equalTo: titleDescStack.trailingAnchor),
			
			// colorSelectorStack
			colorSelectorStack.leadingAnchor.constraint(equalTo: titleDescStack.leadingAnchor),
			colorSelectorStack.trailingAnchor.constraint(equalTo: titleDescStack.trailingAnchor),
			
			// addNewButton
			addHabitButton.leadingAnchor.constraint(equalTo: titleDescStack.leadingAnchor),
			addHabitButton.trailingAnchor.constraint(equalTo: titleDescStack.trailingAnchor),
			addHabitButton.heightAnchor.constraint(equalTo: colorSelectorStack.heightAnchor)
		])
	}
	
	
	// MARK: - Action Methods
	
	@objc func addHabitTapped() {
		UIView.animate(withDuration: 0.1,
					   animations: {
			self.addHabitButton.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
		}, completion: { _ in
			UIView.animate(withDuration: 0.1) {
				self.addHabitButton.transform = .identity
			}
		})
		
		print("Tapped to add new habit")
	}
		
}
