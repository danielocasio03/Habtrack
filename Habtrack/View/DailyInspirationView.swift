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
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Daily Inspiration"
		label.textColor = DesignManager.shared.charcoalTextColor.withAlphaComponent(0.75)
		label.font = UIFont(name: "AvenirNext-DemiBold", size: 22)
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
		label.font = UIFont(name: "Georgia", size: 16)
		return label
	}()
	
	lazy var quoteAuthorLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.numberOfLines = 2
		label.lineBreakMode = .byWordWrapping
		label.font = UIFont(name: "Georgia-Bold", size: 15)
		return label
	}()
	
	private lazy var decorativeQuoteLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.text = "“"
		label.font = UIFont(name: "Georgia-Bold", size: 45)
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
	
	private func setupView() {
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
			quoteTextLabel.leadingAnchor.constraint(equalTo: quoteContainer.leadingAnchor, constant: 45),
			quoteTextLabel.trailingAnchor.constraint(equalTo: quoteContainer.trailingAnchor, constant: -45),
			quoteTextLabel.centerYAnchor.constraint(equalTo: quoteContainer.centerYAnchor, constant: -5),
			quoteTextLabel.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
			quoteAuthorLabel.trailingAnchor.constraint(equalTo: quoteTextLabel.trailingAnchor),
			quoteAuthorLabel.topAnchor.constraint(equalTo: quoteTextLabel.bottomAnchor, constant: 10),
			quoteAuthorLabel.bottomAnchor.constraint(lessThanOrEqualTo: quoteContainer.bottomAnchor, constant: -10),
			decorativeQuoteLabel.topAnchor.constraint(equalTo: quoteContainer.topAnchor, constant: 15),
			decorativeQuoteLabel.trailingAnchor.constraint(equalTo: quoteTextLabel.leadingAnchor, constant: -5)
		])
	}
	
	
	
}
