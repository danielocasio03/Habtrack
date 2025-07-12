//
//  ScreenTitleView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/6/25.
//

import Foundation
import UIKit

// A view meant to act as View's Title/leading heading
class ScreenTitleView: UIView {
	
	//MARK: - Properties & Subviews
		
	private lazy var greetingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "AvenirNext-Bold", size: 27)
		label.textColor = DesignManager.shared.headingTextColor.withAlphaComponent(0.9)
		label.text = DesignManager.shared.greeting
		return label
	}()
	
	private lazy var dividerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.dividerColor
		return view
	}()
	
	
	//MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(frame: .zero)
		setupView()
	}
	
	
	//MARK: - Private Setup Methods
	
	private func setupView() {
		addSubview(greetingLabel)
		addSubview(dividerView)
		
		NSLayoutConstraint.activate([
			greetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: DesignManager.Spacing.standard),
			greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignManager.Spacing.standard),
			dividerView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: DesignManager.Spacing.standard),
			dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			dividerView.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.divider)
		])
		
	}
	
	
}
