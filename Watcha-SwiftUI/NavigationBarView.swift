//
//  NavigationBarController.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var selectedIndex = 0

    private let selectedImages = ["nav1", "nav2", "nav3", "nav4", "nav5"]

    var body: some View {
        
        ZStack(alignment: .bottom) {
            selectedView
              .padding(.bottom, 99)

            customNavigationBar
        }
        .background(.WATCHA_BLACK)
        .toolbar(.hidden, for: .navigationBar)
    }

    private var selectedView: some View {
        
        Group {
            if selectedIndex == 0 {
                SubscribeTabView()
            } else if selectedIndex == 1 {
                EmptyTabView(title: "개별 구매")
            } else if selectedIndex == 2 {
                EmptyTabView(title: "웹툰")
            } else if selectedIndex == 3 {
                EmptyTabView(title: "찾기")
            } else {
                EmptyTabView(title: "보관함")
            }
        }
    }

    private var customNavigationBar: some View {
        
        VStack(spacing: 0) {
            Rectangle()
                .fill(.GRAY_600)
                .frame(height: 2)

            HStack {
                ForEach(0..<selectedImages.count, id: \.self) { index in
                    Button {
                        selectedIndex = index
                    } label: {
                        Image(selectedImages[index])
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(
                                selectedIndex == index
                                ? .WATCHA_WHITE
                                : .GRAY_500
                            )
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
        .frame(height: 99)
        .background(.WATCHA_BLACK)
    }
}

#Preview {
    NavigationBarView()
}
