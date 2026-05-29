//
//  SubscribeViewController.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct SubscribeViewController: View {
    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Text("구독")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundStyle(Color.watchaWhite)

                    Spacer()

                    HStack(spacing: 20) {
                        Image("Video")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)

                        Image("Notification")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)

                        Image("Profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.top, 62)

                Rectangle()
                    .fill(Color.gray600)
                    .frame(height: 1)

                VStack(alignment: .leading, spacing: 12) {
                    Text("방금 막 도착한 신상 콘텐츠")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color.watchaWhite)

                    Text("여기는 나중에 컬렉션뷰/스크롤 콘텐츠를 채우면 되는 임시 영역입니다.")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.gray200)
                }

                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    SubscribeViewController()
}
