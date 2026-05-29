//
//  ContentView.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct WelcomeView: View {
    let nickname: String?
    @State private var isShowingMainView = false

    private var displayName: String {
        nickname ?? "익명의 사용자"
    }

    var body: some View {
        ZStack {
            Color.WATCHA_BLACK
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Image("watcha")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 167)
                    .padding(.top, 85)

                Text("\(displayName)님\n가입을 환영합니다!")
                    .font(.head2)
                    .foregroundStyle(.WATCHA_WHITE)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                    .padding(.top, 54)

                Spacer()

                toMainButton(title: "메인으로", isEnabled: true) {
                    isShowingMainView = true
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 47)
            }
        }
        .navigationDestination(isPresented: $isShowingMainView) {
            NavigationBarView()
        }
    }
}

struct toMainButton: View {
    let title: String
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.medium)
                .foregroundStyle(isEnabled ? .WATCHA_WHITE : .GRAY_200)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(isEnabled ? .WATCHA_PINK : .GRAY_400)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    WelcomeView(nickname: "승희")
}
