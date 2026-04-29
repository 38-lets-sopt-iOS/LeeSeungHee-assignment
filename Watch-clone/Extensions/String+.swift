//
//  String+.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//

import UIKit

extension String {

    func isValidEmail() -> Bool {
        let regex = /[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,}/
        return self.wholeMatch(of: regex) != nil
    }

    func isValidPassword() -> Bool {
        let regex = /(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!_@$%^&+=])[A-Za-z0-9!_@$%^&+=]{10,}/
        return self.wholeMatch(of: regex) != nil
    }
}


