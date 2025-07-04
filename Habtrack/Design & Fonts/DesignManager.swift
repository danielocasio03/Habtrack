//
//  DesignManager.swift
//  Habtrack
//
//  Created by Daniel Efrain Ocasio on 7/2/25.
//

import Foundation
import UIKit

class DesignManager {
	
	// Singleton instance
	public static let shared = DesignManager()
	
	// App Colors
	public var lightBGColor = UIColor(red: 255/255, green: 251/255, blue: 254/255, alpha: 1.0)
	// Container Colors
	public var whiteContColor = UIColor.white
	// Text Colors
	public var charcoalTextColor = UIColor(red: 25/255, green: 23/255, blue: 22/255, alpha: 1.0)
	public var quoteTextColor = UIColor(red: 131/255, green: 54/255, blue: 63/255, alpha: 1.0)
}
