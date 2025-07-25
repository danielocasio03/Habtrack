//
//  PomoStack.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/24/25.
//

import Foundation
import UIKit

class PomoStack: UIStackView {
	
	// MARK: - UI Components
	
	private lazy var usePomodoroStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.axis = .horizontal
		stack.addArrangedSubview(usePomodoroLabel)
		stack.addArrangedSubview(toggleSwitch)
		return stack
	}()
	
	private lazy var usePomodoroLabel: UILabel = {
		let titleLabel = UILabel()
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "Use Pomodoro?"
		titleLabel.textColor = DesignManager.shared.subHeadingTextColor
		titleLabel.font = UIFont(name: "AvenirNext-Medium", size: 15)
		return titleLabel
	}()
	
	private lazy var toggleSwitch: UISwitch = {
		let toggle = UISwitch()
		toggle.translatesAutoresizingMaskIntoConstraints = false
		toggle.onTintColor = DesignManager.shared.accentColor
		toggle.addTarget(self, action: #selector(pomoToggled), for: .valueChanged)
		return toggle
	}()
	
	private lazy var breakCtButton = FormButton(title: "Break Count", value: "2 Breaks", iconSysName: "chevron.up.chevron.down", buttonImgSysName: nil)
	private lazy var breakIntButton = FormButton(title: "Break Interval", value: "10 Min", iconSysName: "chevron.up.chevron.down", buttonImgSysName: nil)

	
	// MARK: - Init/Lifecycle
	
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
		addArrangedSubview(usePomodoroStack)
		addArrangedSubview(breakCtButton)
		addArrangedSubview(breakIntButton)
		breakCtButton.isHidden = true
		breakIntButton.isHidden = true
	}
	
	
	// MARK: - Utility & Action Methods
	
	/// When Pomo is tapped on, make buttons visible with animation, else hidewith animation
	@objc func pomoToggled() {
		UIView.animate(withDuration: 0.5,
					   delay: 0,
					   usingSpringWithDamping: 0.8,
					   initialSpringVelocity: 0,
					   options: .curveEaseInOut ) { [weak self] in
			guard let self = self else {return}
			if toggleSwitch.isOn {
				breakCtButton.alpha = 1
				breakIntButton.alpha = 1
				breakCtButton.isHidden = false
				breakIntButton.isHidden = false
			} else {
				breakCtButton.alpha = 0
				breakIntButton.alpha = 0
				breakCtButton.isHidden = true
				breakIntButton.isHidden = true
			}
			layoutIfNeeded()
		}
	}
}
