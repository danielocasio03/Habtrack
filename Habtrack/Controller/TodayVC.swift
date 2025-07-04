//
//  ViewController.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import UIKit

class TodayVC: UIViewController {
	
	//MARK: - Subviews and Properties
	
	let todayContentView = TodayContentView()

	
	//MARK: - Init/Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupContentView()
	}
	
	
	//MARK: - Setup Methods
	
	func setupView() {
		view.backgroundColor = DesignManager.shared.lightBGColor
	}
	
	func setupContentView() {
		view.addSubview(todayContentView)
		todayContentView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			todayContentView.topAnchor.constraint(equalTo: view.topAnchor),
			todayContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			todayContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			todayContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}


}

