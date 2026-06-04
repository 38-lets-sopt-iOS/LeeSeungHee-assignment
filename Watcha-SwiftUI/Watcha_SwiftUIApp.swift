//
//  Watcha_SwiftUIApp.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

@main
struct Watcha_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WelcomeView(nickname: "승희")
            }
        }
    }
}
