//
//  NavigationBarController.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct NavigationBarController: View {
    @State private var selectedIndex = 0

    private let selectedImages = ["nav1", "nav2", "nav3", "nav4", "nav5"]
    private let unselectedImages = ["nav1", "usnav2", "usnav3", "usnav4", "usnav5"]

    var body: some View {
        ZStack(alignment: .bottom) {
            currentView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, 94)

            customNavigationBar
        }
        .background(Color.watchaBlack)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .navigationBar)
    }

    private var currentView: some View {
        Group {
            if selectedIndex == 0 {
                SubscribeViewController()
            } else if selectedIndex == 1 {
                EmptyViewController(title: "개별 구매")
            } else if selectedIndex == 2 {
                EmptyViewController(title: "웹툰")
            } else if selectedIndex == 3 {
                EmptyViewController(title: "찾기")
            } else {
                EmptyViewController(title: "보관함")
            }
        }
    }

    private var customNavigationBar: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray600)
                .frame(height: 1)

            HStack {
                ForEach(0..<selectedImages.count, id: \.self) { index in
                    Button {
                        selectedIndex = index
                    } label: {
                        Image(selectedIndex == index ? selectedImages[index] : unselectedImages[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .frame(width: 50, height: 56)

                    if index != selectedImages.count - 1 {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 8)

            Spacer()
        }
        .frame(height: 128)
        .background(Color.watchaBlack)
    }
}

#Preview {
    NavigationBarController()
}
