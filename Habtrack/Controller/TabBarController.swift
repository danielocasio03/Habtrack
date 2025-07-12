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
		barButtonTapped()
	}
	
	
	//MARK: - Setup
	
	private func setupTabBar() {
		self.tabBar.isHidden = true
		view.addSubview(customBar)
		customBar.translatesAutoresizingMaskIntoConstraints = false
		
		// Creating Navigation Controllers and adding to TabBar VC's
		let todayNav = UINavigationController(rootViewController: todayVC)
		todayNav.setNavigationBarHidden(true, animated: false)
		
		let analyticsNav = UINavigationController(rootViewController: analyticsVC)
		let calendarNav = UINavigationController(rootViewController: calendarVC)
		let settingsNav = UINavigationController(rootViewController: settingsVC)
		self.viewControllers = [todayNav, analyticsNav, calendarNav, settingsNav]
		
		NSLayoutConstraint.activate([
			customBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
			customBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
			customBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
			customBar.heightAnchor.constraint(equalToConstant: 70)
		])
	}
	
	
	//MARK: - Private Utility Methods
	
	private func barButtonTapped() {
		customBar.barButtonTapped = { index in
			print(index) // Delete - For Testing
			self.selectedIndex = index
		}
	}
	
}
