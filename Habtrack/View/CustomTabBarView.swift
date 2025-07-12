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
	lazy var barButtons = [homeButton, fireButton, calendarButton, settingsButton]
	private lazy var homeButton = generateBarIcon(selectedImage: UIImage(named: "selectedHome") , UnselectedImage: UIImage(named: "unselectedHome"))
	private lazy var fireButton = generateBarIcon(selectedImage: UIImage(named: "blueFire"), UnselectedImage: UIImage(named: "unselectedFire"))
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
			centerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			centerButton.centerYAnchor.constraint(equalTo: topAnchor,constant: 10),
			centerButton.widthAnchor.constraint(equalToConstant: 50), // Change to be dynamic
			centerButton.heightAnchor.constraint(equalToConstant: 50),
			plusImageView.centerXAnchor.constraint(equalTo: centerButton.centerXAnchor),
			plusImageView.centerYAnchor.constraint(equalTo: centerButton.centerYAnchor),
			plusImageView.widthAnchor.constraint(equalTo: centerButton.widthAnchor, multiplier: 0.80),
			plusImageView.heightAnchor.constraint(equalTo: centerButton.heightAnchor, multiplier: 0.80)
		])
	}
	
	func setupBarButtons() {
		addSubview(homeButton)
		homeButton.isSelected = true
		addSubview(fireButton)
		addSubview(calendarButton)
		addSubview(settingsButton)
		addSubview(selectedNotch)
		
		centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: homeButton.centerXAnchor)
		
		NSLayoutConstraint.activate([
			homeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			homeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30), // Change to Spacing enum
			homeButton.heightAnchor.constraint(equalToConstant: 27), // Change to be dynamic
			homeButton.widthAnchor.constraint(equalToConstant: 27),
			fireButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			fireButton.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor, constant: 65),
			fireButton.heightAnchor.constraint(equalToConstant: 27), // Change to be dynamic
			fireButton.widthAnchor.constraint(equalToConstant: 27),
			
			settingsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
			settingsButton.heightAnchor.constraint(equalToConstant: 27), // Change to be dynamic
			settingsButton.widthAnchor.constraint(equalToConstant: 27),
			calendarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			calendarButton.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor, constant: -65), // Change to Spacing enum
			calendarButton.heightAnchor.constraint(equalToConstant: 27), // Change to be dynamic
			calendarButton.widthAnchor.constraint(equalToConstant: 27),

			selectedNotch.widthAnchor.constraint(equalToConstant: 20),
			selectedNotch.heightAnchor.constraint(equalToConstant: 3),
			selectedNotch.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 8),
			centerConstraint
		])
	}
	
	//MARK: - Action Methods
	
	@objc func centerButtonTapped() {
		print("Button Tapped!") // Change - add actual handling to this
	}
	
	/// Deselects all buttons, selecting and moving the notch to user selected tab button
	@objc func barButtonTappedAction(_ sender: UIButton) {
		[homeButton, fireButton, calendarButton, settingsButton].forEach { $0.isSelected = false }
		sender.isSelected = true
		centerConstraint.isActive = false
		removeConstraint(centerConstraint)
		
		switch sender {
		case homeButton:
			centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: homeButton.centerXAnchor)
		case fireButton:
			centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: fireButton.centerXAnchor)
		case calendarButton:
			centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: calendarButton.centerXAnchor)
		case settingsButton:
			centerConstraint = selectedNotch.centerXAnchor.constraint(equalTo: settingsButton.centerXAnchor)
		default:
			break
		}
		
		centerConstraint.isActive = true
		guard let selectedIndex = barButtons.firstIndex(where: { $0.isSelected == true }) else { return }
				
		if let barButtonTapped = barButtonTapped {
			barButtonTapped(selectedIndex)
		}
		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0) {
			self.layoutIfNeeded()
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
}
