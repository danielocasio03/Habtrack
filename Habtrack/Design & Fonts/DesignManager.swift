import Foundation
import UIKit

final class DesignManager {
	static let shared = DesignManager()
	private init() {}
	
	
	//MARK: - Dynamic Content and Utilities
	
	enum Spacing {
		/// Underlying value of 4
		static let tiny: CGFloat = 4
		
		/// Underlying value of 8
		static let small: CGFloat = 8
		
		/// Underlying value of 12
		static let smallMed: CGFloat = 12
		
		/// Underlying value of 16
		static let medium: CGFloat = 16
		
		/// Underlying value of 20
		static let standard: CGFloat = 20
		
		/// Underlying value of 30
		static let large: CGFloat = 30
		
		/// Underlying value of 40
		static let xLarge: CGFloat = 40
		
		/// Underlying value of 50
		static let xxLarge: CGFloat = 50
		
		/// Underlying value of 65
		static let xxxLarge: CGFloat = 65
		
		/// Bottom spacing to avoid custom tab bar overlap (TabBarHeight + spacing from bottom +  center button height/2  )
		static let tabBarBottomSpacing = Sizing.xxxlarge + Spacing.medium + Sizing.large/2
	}
	
	enum Sizing {
		/// Underlying value of 0.5; (For use in Subtle UIView dividers)
		static let divider: CGFloat = 0.5
		
		/// Underlying value of 3
		static let tiny: CGFloat = 3
		
		/// Underlying value of 27
		static let standard: CGFloat = 27
		
		/// Underlying value of 50
		static let large: CGFloat = 50
		
		/// Underlying value of 60
		static let xxLarge: CGFloat = 60
		
		/// Underlying value of 70
		static let xxxlarge: CGFloat = 70
	}
	
	/// Returns greeting based off time of day
	var greeting: String {
		switch Calendar.current.component(.hour, from: Date()) {
		case 6..<12: return "Good Morning"  	// Morning Scheme (6am - 11:59am)
		case 12..<18: return "Good Afternoon" 	// Afternoon Scheme (12pm - 5:59pm)
		default: return "Good Evening"			// Evening Scheme (6pm - 6am)
		}
	}
	
	
	// MARK: - Colors (Light & Dark Mode)
	
	// General View Colors
	var backgroundColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; charcoal black Color
			UIColor(red: 13/255, green: 13/255, blue: 13/255, alpha: 1) :
			
			// Light Mode; off white color
			UIColor(red: 255/255, green: 251/255, blue: 254/255, alpha: 1)
		}
	}
	
	var containerColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; lighter black Color
			UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1) :
			
			// Light Mode; White Color
			UIColor.white
		}
	}
	
	// Heading Text Color; seen in primary static labels like Daily Inspiration heading
	var headingTextColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; Light grey Color
			UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1) :
			
			// Light Mode; Charcoal Color
			UIColor(red: 25/255, green: 23/255, blue: 22/255, alpha: 1)
		}
	}
	
	// Sub Heading Text Color; seen in less focused icons, and headings
	var subHeadingTextColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; Light grey Color
			UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.5) :
			
			// Light Mode; Charcoal Color
			UIColor(red: 25/255, green: 23/255, blue: 22/255, alpha: 0.5)
		}
	}
	
	// Accent text color; seen in the quote and author labels.
	var accentTextColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode: Muted golden orange
			UIColor(red: 255/255, green: 184/255, blue: 108/255, alpha: 1.0) :
			
			// Light Mode: Slightly richer warm orange
			UIColor(red: 215/255, green: 110/255, blue: 50/255, alpha: 1.0)
		}
	}
	
	// Accent text color; seen in the quote and author labels.
	var accentColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; Electric Blue Color
			UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1) :
			
			// Dark Mode; Electric Blue Color
			UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
		}
	}
	
	var shadowColor: UIColor {
		UIColor {$0.userInterfaceStyle == .dark ?
			// Dark Mode; Stronger Shadow
			UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6) :
			
			// Light Mode; Subtle Shadow
			UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
		}
	}
	
	var dividerColor: UIColor {
		UIColor {$0.userInterfaceStyle == .dark ?
			// Dark Mode; Subtle grey divider
			UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 0.5) :
			
			// Light Mode; Light grey divider
			UIColor(red: 208/255, green: 207/255, blue: 207/255, alpha: 0.5)
		}
	}
	
	
	// Habit View Colors
	
	/// Color options for habitView's
	enum HabitColor {
		case pastelRed
		case pastelBlue
		case pastelYellow
		case pastelGreen
		case pastelPurple
		case pastelPink
		case pastelTeal
		case pastelOrange
		
		var color: UIColor {
			switch self {
			case .pastelRed:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper red
					UIColor(red: 180/255, green: 100/255, blue: 100/255, alpha: 1.0) :
					// Light Mode: Pastel red
					UIColor(red: 255/255, green: 165/255, blue: 165/255, alpha: 1.0)
				}
			case .pastelBlue:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper blue
					UIColor(red: 100/255, green: 140/255, blue: 190/255, alpha: 1.0) :
					// Light Mode: Pastel blue
					UIColor(red: 176/255, green: 205/255, blue: 255/255, alpha: 1.0)
				}
			case .pastelYellow:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper yellow/gold
					UIColor(red: 200/255, green: 170/255, blue: 90/255, alpha: 1.0) :
					// Light Mode: Pastel yellow
					UIColor(red: 255/255, green: 227/255, blue: 159/255, alpha: 1.0)
				}
			case .pastelGreen:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper green
					UIColor(red: 90/255, green: 170/255, blue: 90/255, alpha: 1.0) :
					// Light Mode: Pastel green
					UIColor(red: 152/255, green: 251/255, blue: 152/255, alpha: 1.0)
				}
			case .pastelPurple:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper purple
					UIColor(red: 150/255, green: 100/255, blue: 150/255, alpha: 1.0) :
					// Light Mode: Pastel purple
					UIColor(red: 221/255, green: 160/255, blue: 221/255, alpha: 1.0)
				}
			case .pastelPink:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper pink
					UIColor(red: 180/255, green: 120/255, blue: 130/255, alpha: 1.0) :
					// Light Mode: Pastel pink
					UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1.0)
				}
			case .pastelTeal:
				return UIColor { $0.userInterfaceStyle == .dark ?
					// Dark Mode: Deeper Teal
					UIColor(red: 118/255, green: 211/255, blue: 205/255, alpha: 1.0) :
					// Light Mode: pastel Teal
					UIColor(red: 178/255, green: 255/255, blue: 242/255, alpha: 1.0) 
				}
			case .pastelOrange:
				return UIColor { $0.userInterfaceStyle == .dark ?
				// Dark Mode: Deeper Orange
					UIColor(red: 255/255, green: 167/255, blue: 99/255, alpha: 1.0) :
				// Light Mode: Pastel Orange
					UIColor(red: 255/255, green: 204/255, blue: 153/255, alpha: 1.0)
				}
			}
		}
	}
	
}
