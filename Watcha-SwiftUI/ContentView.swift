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
                    textContentType: .emailAddress,
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

    @State private var password = ""
    @State private var nickname: String?
    @State private var isPasswordHidden = true
    @State private var isShowingNicknameSheet = false
    @State private var isShowingWelcomeView = false

    private var isValidPassword: Bool {
        password.isValidPassword()
    }

    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text("사용할 비밀번호를\n입력해주세요")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundStyle(Color.watchaWhite)
                    .lineSpacing(2)
                    .padding(.top, 152)

                Text("\(email)로 가입중")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.gray100)
                    .padding(.top, 13)

                WatchaTextField(
                    placeholder: "비밀번호 입력",
                    text: $password,
                    isSecure: isPasswordHidden,
                    textContentType: .password,
                    rightView: passwordRightView
                )
                .padding(.top, 44)

                HStack(spacing: 6) {
                    Image(isValidPassword ? "enable-on" : "enable-off")
                        .resizable()
                        .frame(width: 13, height: 13)

                    Text("영문, 숫자, 특수문자 포함 10글자 이상")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(isValidPassword ? Color.watchaGreen : Color.gray100)
                }
                .padding(.top, 13)
                .padding(.leading, 4)

                Button {
                    isShowingNicknameSheet = true
                } label: {
                    Text(nicknameText)
                        .font(.system(size: 12, weight: .regular))
                        .underline(nickname == nil)
                        .foregroundStyle(Color.gray100)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)

                Spacer()

                WatchaButton(title: "가입하기", isEnabled: isValidPassword) {
                    isShowingWelcomeView = true
                }
                .padding(.bottom, 47)
            }
            .padding(.horizontal, 31)
        }
        .navigationDestination(isPresented: $isShowingWelcomeView) {
            WelcomeView(nickname: nickname)
        }
        .sheet(isPresented: $isShowingNicknameSheet) {
            NicknameView(nickname: $nickname)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
        }
    }

    private var nicknameText: String {
        if let nickname, !nickname.isEmpty {
            return "Nickname : \(nickname)"
        } else {
            return "닉네임 설정"
        }
    }

    private var passwordRightView: some View {
        HStack(spacing: 4) {
            Button {
                password = ""
            } label: {
                Image("x")
                    .resizable()
                    .frame(width: 24, height: 24)
            }

            Button {
                isPasswordHidden.toggle()
            } label: {
                Image(isPasswordHidden ? "eye-off" : "eye-on")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

struct NicknameView: View {
    @Binding var nickname: String?
    @Environment(\.dismiss) private var dismiss

    @State private var inputNickname = ""

    var body: some View {
        ZStack {
            Color.watchaBlack
                .opacity(0.95)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text("닉네임을 입력해주세요")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color.watchaWhite)
                    .padding(.top, 42)

                WatchaTextField(
                    placeholder: "nickname",
                    text: $inputNickname,
                    isSecure: false,
                    rightView: EmptyView()
                )
                .padding(.top, 19)

                Spacer()

                WatchaButton(title: "완료", isEnabled: true) {
                    nickname = inputNickname
                    dismiss()
                }
                .padding(.bottom, 47)
            }
            .padding(.horizontal, 31)
        }
    }
}

struct WelcomeView: View {
    let nickname: String?

    private var displayName: String {
        if let nickname, !nickname.isEmpty {
            return nickname
        } else {
            return "익명의 사용자"
        }
    }

    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Image("watcha")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 167)
                    .padding(.top, 85)

                Text("\(displayName)님\n가입을 환영합니다!")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundStyle(Color.watchaWhite)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                    .padding(.top, 54)

                Spacer()

                WatchaButton(title: "메인으로", isEnabled: true) {}
                    .padding(.horizontal, 22)
                    .padding(.bottom, 47)
            }
        }
    }
}

#Preview {
    ContentView()
}
