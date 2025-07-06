import Foundation
import UIKit

final class DesignManager {
	static let shared = DesignManager()
	private init() {}
	
	// MARK: - Colors (Light & Dark Mode)
	var backgroundColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; charcoal black Color
			UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1) :
			// Light Mode; off white color
			UIColor(red: 255/255, green: 251/255, blue: 254/255, alpha: 1)
		}
	}
	
	var containerColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; lighter black Color
			UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1) :
			// Light Mode; White Color
			UIColor.white
		}
	}
	
	// Heading Text Color; seen in primary static labels like Daily Inspiration heading
	var headingTextColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; Light grey Color
			UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 1) :
			// Light Mode; Charcoal Color
			UIColor(red: 25/255, green: 23/255, blue: 22/255, alpha: 1)
		}
	}
	
	// Accent text color; seen in the quote and author labels.  : Dark = Orange
	var accentTextColor: UIColor {
		UIColor { $0.userInterfaceStyle == .dark ?
			// Dark Mode; Orange Color
			UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1) :
			// Light Mode; Red Color
			UIColor(red: 131/255, green: 54/255, blue: 63/255, alpha: 1)
		}
	}
}
