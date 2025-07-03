//
//  MainTabBarController.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
	
	// View Controllers
	let todayVC: TodayVC = {
		let vc = TodayVC()
		vc.title = "Today"
		vc.tabBarItem = UITabBarItem (
			title: "Today",
			image: UIImage(systemName: "checkmark.seal"),
			selectedImage: UIImage(systemName: "checkmark.seal.fill")
		)
		return vc
	}()
	
	let habitsVC: MyHabitsVC = {
		let vc = MyHabitsVC()
		vc.title = "My Habits"
		vc.tabBarItem = UITabBarItem(
			title: "My Habits",
			image: UIImage(systemName: "list.clipboard"),
			selectedImage: UIImage(systemName: "list.bullet.clipboard.fill")
		)
		return vc
	}()
	
	// Init
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tabBar.tintColor = UIColor(red: 88/255, green: 105/255, blue: 148/255, alpha: 1.0)
		
		// Creating Navigation Controllers and adding to TabBar VC's
		let todayNav = UINavigationController(rootViewController: todayVC)
		let habitsNav = UINavigationController(rootViewController: habitsVC)
		self.viewControllers = [todayNav, habitsNav]
		
	}
	
}
