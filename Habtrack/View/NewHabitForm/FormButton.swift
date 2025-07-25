//
//  Form Button.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/25/25.
//

import Foundation
import UIKit

class FormButton: UIButton {
	
	// MARK: - UI Components
	
	private lazy var buttonTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.subHeadingTextColor
		label.font = UIFont(name: "AvenirNext-Medium", size: 15)
		return label
	}()
	
	private lazy var valueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.headingTextColor
		label.font = UIFont(name: "AvenirNext-Medium", size: 15)
		return label
	}()
	
	private lazy var icon: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = DesignManager.shared.subHeadingTextColor
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	private lazy var buttonImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = DesignManager.shared.subHeadingTextColor
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	// MARK: - Init/Lifecycle
	
	init(title: String, value: String, iconSysName: String, buttonImgSysName: String?) {
		super.init(frame: .zero)
		setupView()
		configureButton(title: title, value: value, iconSysName: iconSysName, buttonImgSysName: buttonImgSysName)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup Methods
	
	private func setupView() {
		translatesAutoresizingMaskIntoConstraints = false
		addSubview(buttonImage)
		addSubview(buttonTitleLabel)
		addSubview(valueLabel)
		addSubview(icon)
		
		NSLayoutConstraint.activate([
			// Button image
			buttonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignManager.Spacing.small),
			buttonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			// titleLabel
			buttonTitleLabel.leadingAnchor.constraint(equalTo: buttonImage.trailingAnchor, constant: DesignManager.Spacing.small),
			buttonTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			// chevronIcon
			icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DesignManager.Spacing.small),
			icon.centerYAnchor.constraint(equalTo: buttonTitleLabel.centerYAnchor),
			
			// userSetLabel
			valueLabel.trailingAnchor.constraint(equalTo: icon.leadingAnchor, constant: -DesignManager.Spacing.standard),
			valueLabel.centerYAnchor.constraint(equalTo: buttonTitleLabel.centerYAnchor),
		])
	}
	
	private func configureButton (title: String, value: String, iconSysName: String, buttonImgSysName: String?) {
		buttonTitleLabel.text = title
		valueLabel.text = value
		icon.image = UIImage(systemName: iconSysName)
		
		if let imageName = buttonImgSysName {
			buttonImage.image = UIImage(systemName: imageName)
		} else {
			buttonImage.isHidden = true
		}
	}
	
}
