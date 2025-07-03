//
//  DailyInspirationView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import Foundation
import UIKit

class DailyInspirationView: UIView {
	
	lazy var quoteContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.whiteContColor
		
		return view
		
	}()
	
	
	//Init
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
