//
//  GoalStartStack.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/22/25.
//

import Foundation
import UIKit

class GoalStartStack: UIStackView {
	
	// MARK: - UI Components
	private lazy var goalButton = FormButton(title: "Time Goal", value: "1 hr 0 min", iconSysName: "chevron.up.chevron.down", buttonImgSysName: "timer")
	private lazy var startDateButton = FormButton(title: "Start Date", value: "Aug 4th 2025", iconSysName: "chevron.up.chevron.down", buttonImgSysName: "calendar")
	
	private lazy var dividerView: UIView = {
		let view  = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.backgroundColor
		view.heightAnchor.constraint(equalToConstant: 1).isActive = true
		return view
	}()
	
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupStack()
		setupSubviews()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup Methods
	
	private func setupStack() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = DesignManager.shared.containerColor
		layer.cornerRadius = 10
		axis = .vertical
		distribution = .fill
		alignment = .fill
		spacing = DesignManager.Spacing.small
		isLayoutMarginsRelativeArrangement = true
		layoutMargins = UIEdgeInsets (
			top: DesignManager.Spacing.small,
			left: DesignManager.Spacing.smallMed,
			bottom: DesignManager.Spacing.small,
			right: DesignManager.Spacing.smallMed
		)
		
		//shadow
		layer.shadowRadius = 4
		layer.shadowColor = DesignManager.shared.shadowColor.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.25
		layer.masksToBounds = false
	}
	
	private func setupSubviews() {
		addArrangedSubview(goalButton)
		addArrangedSubview(dividerView)
		addArrangedSubview(startDateButton)
	}
}
