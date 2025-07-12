//
//  CustomTabBarView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/10/25.
//

import Foundation
import UIKit

class CustomTabBarView: UIView {
	
	//MARK: - Properties

	/// Constraint for centering the notch under selected icon
	var centerConstraint: NSLayoutConstraint!
	var barButtonTapped: ((_ at: Int) -> Void)?
	
	
	//MARK: - UI Components
		
	private lazy var centerButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = DesignManager.shared.accentColor
		button.tintColor = .white
		button.layer.cornerRadius = 12
		button.transform = CGAffineTransform(rotationAngle: .pi/4)
		button.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var plusImageView: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.transform = CGAffineTransform(rotationAngle: -.pi/4)
		image.image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
		image.tintColor = .white
		image.contentMode = .scaleAspectFit
		image.isUserInteractionEnabled = false
		return image
	}()
	
	private lazy var selectedNotch: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.accentColor
		view.layer.cornerRadius = 2
		return view
	}()
	
	// TabBar Buttons
	lazy var barButtons = [homeButton, analyticsButton, calendarButton, settingsButton]
	private lazy var homeButton = generateBarIcon(selectedImage: UIImage(named: "selectedHome") , UnselectedImage: UIImage(named: "unselectedHome"))
	private lazy var analyticsButton = generateBarIcon(selectedImage: UIImage(named: "blueFire"), UnselectedImage: UIImage(named: "unselectedFire"))
	private lazy var calendarButton = generateBarIcon(selectedImage: UIImage(named: "selectedCalendar"), UnselectedImage: UIImage(named: "unselectedCalendar"))
	private lazy var settingsButton = generateBarIcon(selectedImage: UIImage(named: "selectedSettings"), UnselectedImage: UIImage(named: "unselectedSettings"))
		
	
	//MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setupCenterButton()
		setupBarButtons()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
	//MARK: - Setup Methods
	
	private func setupView() {
		backgroundColor = DesignManager.shared.containerColor
		self.layer.cornerRadius = 20
		// Shadow
		layer.shadowRadius = 4
		layer.shadowColor = DesignManager.shared.shadowColor.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.25
		layer.masksToBounds = false
	}
	
	private func setupCenterButton() {
		addSubview(centerButton)
		centerButton.addSubview(plusImageView)
		
		NSLayoutConstraint.activate([
			// Center Button Constraints
			centerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			centerButton.centerYAnchor.constraint(equalTo: topAnchor,constant: DesignManager.Spacing.small),
			centerButton.widthAnchor.constraint(equalToConstant: DesignManager.Sizing.large),
			centerButton.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.large),
			// Plus Image View Constraints
			plusImageView.centerXAnchor.constraint(equalTo: centerButton.centerXAnchor),
			plusImageView.centerYAnchor.constraint(equalTo: centerButton.centerYAnchor),
			plusImageView.widthAnchor.constraint(equalTo: centerButton.widthAnchor, multiplier: 0.80),
			plusImageView.heightAnchor.constraint(equalTo: centerButton.heightAnchor, multiplier: 0.80)
		])
	}
	
	private func setupBarButtons() {
		addSubview(homeButton)
		addSubview(analyticsButton)
		addSubview(calendarButton)
		addSubview(settingsButton)
		addSubview(selectedNotch)
		
		homeButton.isSelected = true
		centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: homeButton.centerXAnchor)
		
		NSLayoutConstraint.activate([
			// Home Button Constraints
			homeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			homeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignManager.Spacing.large),
			homeButton.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			homeButton.widthAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			// Analytics Button Constraints
			analyticsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			analyticsButton.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor, constant: DesignManager.Spacing.xxxLarge),
			analyticsButton.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			analyticsButton.widthAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			// Settings Button Constraints
			settingsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DesignManager.Spacing.large),
			settingsButton.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			settingsButton.widthAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			// Calendar Button Constraints
			calendarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			calendarButton.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor, constant: -DesignManager.Spacing.xxxLarge),
			calendarButton.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			calendarButton.widthAnchor.constraint(equalToConstant: DesignManager.Sizing.standard),
			// Selected Notch Constraints
			selectedNotch.heightAnchor.constraint(equalToConstant: DesignManager.Sizing.tiny),
			selectedNotch.widthAnchor.constraint(equalTo: homeButton.widthAnchor, multiplier: 0.75),
			selectedNotch.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: DesignManager.Spacing.small),
			centerConstraint
		])
	}
	
	
	//MARK: - Action Methods
	
	@objc func centerButtonTapped() {
		print("Button Tapped!") // Change - add actual handling to this
	}
	
	/// Update UI and call callback method passing in button index
	@objc func barButtonTappedAction(_ sender: UIButton) {
		updateSelectedTab(selectedButton: sender)
		
		guard let selectedIndex = barButtons.firstIndex(where: { $0.isSelected == true }) else { return }
		if let barButtonTapped = barButtonTapped {
			barButtonTapped(selectedIndex)
		}
	}
	
	
	//MARK: - Private Utility Methods
	
	/// Generates a Bar Icon with provided selected and unselected state images
	private func generateBarIcon(selectedImage: UIImage?, UnselectedImage: UIImage?) -> UIButton {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(selectedImage, for: .selected)
		button.setImage(UnselectedImage, for: .normal)
		button.imageView?.contentMode = .scaleAspectFit
		button.addTarget(self, action: #selector(barButtonTappedAction), for: .touchUpInside)
		return button
	}
	
	/// Handles the UI updates for selected tab icon; Changes highlighted tab, moves notch to selected tab, and animates
	private func updateSelectedTab(selectedButton: UIButton) {
		[homeButton, analyticsButton, calendarButton, settingsButton].forEach { $0.isSelected = false } // 1. Deselect all buttons, select tapped button
		selectedButton.isSelected = true

		centerConstraint.isActive = false // 2. Removing prior center constraint for notch location
		removeConstraint(centerConstraint)
	
		centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: selectedButton.centerXAnchor) // 3. Setting new center constraint for notch locale
		centerConstraint.isActive = true
		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0) {
			self.layoutIfNeeded()
		}
	}
}
