//
//  Typography.swift
//  Iweather
//
//  Created by pablo henrique on 07/12/25.
//

import Foundation
import UIKit

public struct Typography {

    static let headingHG = UIFont(name: "Nunito-ExtraBold", size: 96) ?? UIFont.systemFont(ofSize: 96, weight: .bold)
    static let headingXL = UIFont(name: "Nunito-ExtraBold", size: 48) ?? UIFont.systemFont(ofSize: 48, weight: .bold)
    static let headingLG = UIFont(name: "Nunito-Bold", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .semibold)
    static let headingMD = UIFont(name: "Nunito-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let headingSM = UIFont(name: "Nunito-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let headingXS = UIFont(name: "Nunito-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
    
    static let textLG = UIFont(name: "Nunito-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .medium)
    static let textMD = UIFont(name: "Nunito-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    static let textSM = UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
    static let textXS = UIFont(name: "Nunito-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
    static let textXSB = UIFont(name: "Nunito-Bold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
}
