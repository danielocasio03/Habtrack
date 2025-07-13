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
	
	private func barButtonTapped() {
		customBar.barButtonTapped = { index in
			print(index) // Delete - For Testing
			self.selectedIndex = index
		}
	}
	
}
