//
//  DailyInspirationView.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import Foundation
import UIKit
import SkeletonView

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
	
	private lazy var quoteContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.whiteContColor
		view.layer.cornerRadius = 10
		view.isSkeletonable = true
		//shadow
		view.layer.shadowRadius = 4
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0, height: 1)
		view.layer.shadowOpacity = 0.25
		view.layer.masksToBounds = false
		return view
	}()
	
	private lazy var quoteTextLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.font = UIFont(name: "Georgia", size: 16)
		label.isSkeletonable = true
		label.skeletonTextNumberOfLines = 2
		return label
	}()
	
	lazy var quoteAuthorLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.quoteTextColor
		label.numberOfLines = 2
		label.lineBreakMode = .byWordWrapping
		label.font = UIFont(name: "Georgia-Bold", size: 15)
		label.isSkeletonable = true
		label.skeletonTextNumberOfLines = 1
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
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		super.init(frame: .zero)
		setupView()
		setupSubviews()
	}
	
	
	//MARK: - Private Setup Methods
	
	private func setupView() {
		isSkeletonable = true
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
	}
	
	/// Setup the views child subviews
	private func setupSubviews() {
		quoteContainer.addSubview(quoteTextLabel)
		quoteContainer.addSubview(quoteAuthorLabel)
		quoteContainer.addSubview(decorativeQuoteLabel)
		
		NSLayoutConstraint.activate([
			quoteTextLabel.leadingAnchor.constraint(equalTo: quoteContainer.leadingAnchor, constant: 45),
			quoteTextLabel.trailingAnchor.constraint(equalTo: quoteContainer.trailingAnchor, constant: -45),
			quoteTextLabel.centerYAnchor.constraint(equalTo: quoteContainer.centerYAnchor, constant: -5),
			quoteAuthorLabel.trailingAnchor.constraint(equalTo: quoteTextLabel.trailingAnchor),
			quoteAuthorLabel.topAnchor.constraint(equalTo: quoteTextLabel.bottomAnchor, constant: 10),
			quoteAuthorLabel.bottomAnchor.constraint(lessThanOrEqualTo: quoteContainer.bottomAnchor, constant: -10),
			decorativeQuoteLabel.topAnchor.constraint(equalTo: quoteContainer.topAnchor, constant: 15),
			decorativeQuoteLabel.trailingAnchor.constraint(equalTo: quoteTextLabel.leadingAnchor, constant: -5)
		])
	}
	
	//MARK: - Public Setup Methods
	
	/// Takes in a new DailyQuote object and updates quoteText and quoteAuthor Labels
	public func updateQuote(newQuote: DailyQuote) {
		self.quoteTextLabel.text = newQuote.quote
		self.quoteAuthorLabel.text = newQuote.author
	}
	
	/// Method for showing the Skeleton's in constainers subviews
	public func showQuoteSkeleton() {
		quoteTextLabel.text = "Loading Today's Quote. Get ready to be inspired..."
		quoteAuthorLabel.text = "Loading Author..."
		quoteContainer.showAnimatedGradientSkeleton()
	}
	
	/// Method for hiding the Skeleton's in containers subviews
	public func hideQuoteSkeleton() {
		quoteContainer.hideSkeleton(transition: .crossDissolve(0.25))
	}
	
}
