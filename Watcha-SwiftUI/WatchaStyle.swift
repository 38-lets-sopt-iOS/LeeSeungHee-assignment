//
//  WatchaStyle.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

extension Color {
    static let watchaBlack = Color("WATCHA_BLACK")
    static let watchaWhite = Color("WATCHA_WHITE")
    static let watchaPink = Color("WATCHA_PINK")
    static let watchaGreen = Color("WATCHA_GREEN")
    static let gray100 = Color("GRAY_100")
    static let gray200 = Color("GRAY_200")
    static let gray300 = Color("GRAY_300")
    static let gray400 = Color("GRAY_400")
    static let gray600 = Color("GRAY_600")
}

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

struct WatchaButton: View {
    let title: String
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(isEnabled ? Color.watchaWhite : Color.gray200)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(isEnabled ? Color.watchaPink : Color.gray400)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .disabled(!isEnabled)
    }
}

struct WatchaTextField<RightView: View>: View {
    let placeholder: String
    @Binding var text: String
    let isSecure: Bool
    let rightView: RightView

    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 8) {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .focused($isFocused)
            } else {
                TextField(placeholder, text: $text)
                    .focused($isFocused)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }

            rightView
        }
        .font(.system(size: 12, weight: .regular))
        .foregroundStyle(Color.watchaWhite)
        .padding(.horizontal, 14)
        .frame(height: 47)
        .background(Color.gray600)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFocused ? Color.watchaPink : Color.clear, lineWidth: 1)
        }
    }
}
