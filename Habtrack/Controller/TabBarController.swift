//
//  MainTabBarController.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
	
	//MARK: - Properties
	
	
	//MARK: - UI Components
	
	let customBar = CustomTabBarView()
	
	let todayVC: TodayVC = {
		let vc = TodayVC()
		vc.title = "Today"
		return vc
	}()
	
	let analyticsVC: AnalyticsVC = {
		let vc = AnalyticsVC()
		vc.title = "My Habits"
		return vc
	}()
	
	let calendarVC: CalendarVC = {
		let vc = CalendarVC()
		vc.title = "Calendar"
		return vc
	}()
	
	let settingsVC: SettingsVC = {
		let vc = SettingsVC()
		vc.title = "Settings"
		return vc
	}()
	
	//MARK: - Init
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabBar()
		setupNavControllers()
		barButtonTapped()
		centerButtonTapped()
	}
	
	
	//MARK: - Setup
	
	private func setupTabBar() {
		self.tabBar.isHidden = true
		view.addSubview(customBar)
		customBar.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			customBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DesignManager.Spacing.large),
			customBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -DesignManager.Spacing.large),
			customBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -DesignManager.Spacing.medium),
			customBar.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.xxxlarge)
		])
	}
	
	private func setupNavControllers() {
		let todayNav = UINavigationController(rootViewController: todayVC)
		todayNav.setNavigationBarHidden(true, animated: false)
		let analyticsNav = UINavigationController(rootViewController: analyticsVC)
		let calendarNav = UINavigationController(rootViewController: calendarVC)
		let settingsNav = UINavigationController(rootViewController: settingsVC)
		
		self.viewControllers = [todayNav, analyticsNav, calendarNav, settingsNav]
	}
	
	
	//MARK: - Private Utility Methods
	
	/// Helper method for creating NewHabitFormVC and presenting
	private func presentNewHabitForm() {
		let newHabitFormVC = NewHabitFormVC()
		let newHabitNav = UINavigationController(rootViewController: newHabitFormVC)
		
		newHabitFormVC.title = "Create New Habit"
		newHabitFormVC.navigationItem.leftBarButtonItem = UIBarButtonItem (
			title: "Cancel",
			style: .plain,
			target: self,
			action: #selector(cancelTapped)
		)
		newHabitFormVC.navigationController?.navigationBar.backgroundColor = DesignManager.shared.containerColor
		self.present(newHabitNav, animated: true)
	}
	
	 /// Helper method for changing tabs
	private func changeTab(index: Int) {
		self.selectedIndex = index
	}
	
	
	// MARK: - Action Methods
	
	///  Handler method adding behavior to when a barButton is tapped
	private func barButtonTapped() {
		customBar.barButtonTapHandler = { [weak self] index in
			guard let self = self else {return}
			changeTab(index: index)
		}
	}
	
	///  Handler method adding behavior to when centerButton is tapped
	private func centerButtonTapped() {
		customBar.centerTapHandler = { [weak self] in
			guard let self = self else {return}
			presentNewHabitForm()
		}
	}
	
	/// Handler method for when cancel is tapped on a presented VC
	@objc func cancelTapped() {
		dismiss(animated: true)
	}
	
}
