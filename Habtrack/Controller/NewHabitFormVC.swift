//
//  CreateNewHabitVC.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/14/25.
//

import Foundation
import UIKit

class NewHabitFormVC: UIViewController {
	
	// MARK: - Properties
	lazy var newHabitView = NewHabitFormView()
	
	
	// MARK: - Init & LifeCycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	
	// MARK: - Setup Methods
	
	func setupView() {
		self.view.backgroundColor = DesignManager.shared.backgroundColor
		view.addSubview(newHabitView)
		newHabitView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			newHabitView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			newHabitView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			newHabitView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			newHabitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		])
	}
	
}
