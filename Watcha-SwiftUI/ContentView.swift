//
//  ContentView.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            LoginView()
        }
        .tint(.watchaWhite)
    }
}

struct LoginView: View {
    @State private var email = ""

    private var isValidEmail: Bool {
        email.isValidEmail()
    }

    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text("로그인/가입하려는\n이메일을 입력해주세요")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundStyle(Color.watchaWhite)
                    .lineSpacing(2)
                    .padding(.top, 152)

                Text("결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.gray200)
                    .lineSpacing(2)
                    .padding(.top, 13)

                WatchaTextField(
                    placeholder: "email@address.com",
                    text: $email,
                    isSecure: false,
                    rightView: emailRightView
                )
                .padding(.top, 13)

                Spacer()

                NavigationLink {
                    PasswordView(email: email)
                } label: {
                    Text("다음")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(isValidEmail ? Color.watchaWhite : Color.gray200)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(isValidEmail ? Color.watchaPink : Color.gray400)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(!isValidEmail)
                .padding(.bottom, 47)
            }
            .padding(.horizontal, 31)
        }
        .navigationBarBackButtonHidden()
    }

    private var emailRightView: some View {
        HStack(spacing: 4) {
            Button {
                email = ""
            } label: {
                Image("x")
                    .resizable()
                    .frame(width: 24, height: 24)
            }

            Image(isValidEmail ? "check-on" : "check-off")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}

struct PasswordView: View {
    let email: String

    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()

            Text("\(email)로 가입중")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color.gray100)
        }
    }
}

#Preview {
    ContentView()
}
