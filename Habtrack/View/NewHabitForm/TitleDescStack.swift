//
//  titleDescStack.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/23/25.
//

import Foundation
import UIKit

class TitleDescStack: UIStackView {
	
	
	// MARK: - UI Components
	
	private lazy var imageContainer: UIView = {
		let view = UIView()
		let icon = UIImageView(image: UIImage(systemName: "a.square"))
		icon.translatesAutoresizingMaskIntoConstraints = false
		icon.tintColor = DesignManager.shared.subHeadingTextColor
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(icon)
		
		NSLayoutConstraint.activate([
			view.widthAnchor.constraint(equalToConstant: 36),
			view.heightAnchor.constraint(equalToConstant: 32),
			
			icon.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			icon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			icon.widthAnchor.constraint(equalToConstant: 22),
			icon.heightAnchor.constraint(equalToConstant: 22)
		])

		return view
	}()
	
	private lazy var habitTitleField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.attributedPlaceholder = NSAttributedString (
			string: "Habit Title",
			attributes: [ .font: UIFont(name: "AvenirNext-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16) ]
		)
		field.leftView = imageContainer
		field.leftViewMode = .always
		field.returnKeyType = .next
		field.clearButtonMode = .whileEditing
		return field
	}()
	
	private lazy var habitDescField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.attributedPlaceholder = NSAttributedString (
			string: "Description (optional)",
			attributes: [ .font: UIFont(name: "AvenirNext-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16) ]
		)
		field.clearButtonMode = .whileEditing
		field.returnKeyType = .done
		return field
	}()
	
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
	
	
	// MARK: - Setup methods
	
	private func setupStack() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = DesignManager.shared.containerColor
		layer.cornerRadius = 10
		axis = .vertical
		distribution = .fill
		alignment = .fill
		spacing = DesignManager.Spacing.smallMed
		isLayoutMarginsRelativeArrangement = true
		layoutMargins = UIEdgeInsets (
			top: DesignManager.Spacing.medium,
			left: DesignManager.Spacing.medium,
			bottom: DesignManager.Spacing.large,
			right: DesignManager.Spacing.medium
		)
		
		//shadow
		layer.shadowRadius = 4
		layer.shadowColor = DesignManager.shared.shadowColor.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.25
		layer.masksToBounds = false
	}
	
	private func setupSubviews() {
		addArrangedSubview(habitTitleField)
		addArrangedSubview(dividerView)
		addArrangedSubview(habitDescField)
		
		habitTitleField.delegate = self
		habitDescField.delegate = self
	}
	
}

extension TitleDescStack: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == habitTitleField {
			habitDescField.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		
		return true
	}
	
}
