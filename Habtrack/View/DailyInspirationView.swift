//
//  DailyInspirationView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import Foundation
import UIKit

class DailyInspirationView: UIView {
	
	//MARK: - Subviews and Properties
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Daily Inspiration"
		label.textColor = DesignManager.shared.charcoalTextColor.withAlphaComponent(0.75)
		label.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
		return label
	}()
	
	lazy var quoteContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.whiteContColor
		view.layer.cornerRadius = 10
		//shadow
		view.layer.shadowRadius = 4
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0, height: 1)
		view.layer.shadowOpacity = 0.25
		view.layer.masksToBounds = false
		return view
	}()
	
	lazy var quoteTextLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.numberOfLines = 3
		label.lineBreakMode = .byWordWrapping
		label.text = "You can never cross the ocean until you have the courage to lose sight of the shore." // Delete
		label.font = UIFont(name: "AvenirNext-Regular", size: 14) // Change to use Alexandria after imported
		return label
	}()
	
	lazy var quoteAuthorLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.numberOfLines = 2
		label.lineBreakMode = .byWordWrapping
		label.text = "Christopher Columbus" // Delete
		label.font = UIFont(name: "AvenirNext-Bold", size: 14) // Change to use Alexandria after imported
		return label
	}()
	
	lazy var decorativeQuoteLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.text = "“"
		label.font = UIFont(name: "AvenirNext-Bold", size: 40) // Change to use Alexandria-Bold after its imported
		return label
	}()
	
	
	//MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: - Setup Methods
	
	func setupView() {
		addSubview(titleLabel)
		addSubview(quoteContainer)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			quoteContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			quoteContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
			quoteContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
			quoteContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
		
		quoteContainer.addSubview(quoteTextLabel)
		quoteContainer.addSubview(quoteAuthorLabel)
		quoteContainer.addSubview(decorativeQuoteLabel)
		
		NSLayoutConstraint.activate([
			quoteTextLabel.leadingAnchor.constraint(equalTo: quoteContainer.leadingAnchor, constant: 40),
			quoteTextLabel.trailingAnchor.constraint(equalTo: quoteContainer.trailingAnchor, constant: -40),
			quoteTextLabel.centerYAnchor.constraint(equalTo: quoteContainer.centerYAnchor),
			quoteTextLabel.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
			quoteAuthorLabel.trailingAnchor.constraint(equalTo: quoteContainer.trailingAnchor, constant: -20),
			quoteAuthorLabel.topAnchor.constraint(greaterThanOrEqualTo: quoteTextLabel.bottomAnchor),
			quoteAuthorLabel.bottomAnchor.constraint(equalTo: quoteContainer.bottomAnchor, constant: -10),
			decorativeQuoteLabel.topAnchor.constraint(equalTo: quoteContainer.topAnchor, constant: 10),
			decorativeQuoteLabel.trailingAnchor.constraint(equalTo: quoteTextLabel.leadingAnchor, constant: -5)
		])

	}
	
	
	
}
