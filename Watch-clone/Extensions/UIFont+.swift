//
//  UIFont+.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/24/26.
//

import UIKit

extension UIFont {
//MARK: - Pretendard Font
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"

        var weightString: String
        switch weight {
        case .black:
            weightString = "Black"
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
    
//MARK: - Font System
    static var head1: UIFont {
        return UIFont.pretendard(size: 30, weight: .semibold)
    }
    static var head2: UIFont {
        return UIFont.pretendard(size: 23, weight: .semibold)
    }
    static var head3: UIFont {
        return UIFont.pretendard(size: 20, weight: .semibold)
    }
    static var subhead1: UIFont {
        return UIFont.pretendard(size: 18, weight: .semibold)
    }
    static var subhead2: UIFont {
        return UIFont.pretendard(size: 15, weight: .semibold)
    }
    static var subhead3: UIFont {
        return UIFont.pretendard(size: 12, weight: .semibold)
    }
    static var medium: UIFont {
        return UIFont.pretendard(size: 18, weight: .medium)
    }
    static var body1: UIFont {
        return UIFont.pretendard(size: 12, weight: .medium)
    }
    static var body2: UIFont {
        return UIFont.pretendard(size: 12, weight: .regular)
    }
    static var cap1: UIFont {
        return UIFont.pretendard(size: 12, weight: .light)
    }
    
    
}
