//
//  ViewController.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import UIKit

class TodayVC: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
	}
	
	func setupView() {
		view.backgroundColor = DesignManager.shared.lightBGColor
	}


}

