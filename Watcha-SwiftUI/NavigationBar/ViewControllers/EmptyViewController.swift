//
//  EmptyViewController.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct EmptyViewController: View {
    let title: String

    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text(title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(Color.watchaWhite)

                Image("mandoo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                Text(" . . 텅 ~")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(Color.watchaGreen)
            }
        }
    }
}

#Preview {
    EmptyViewController(title: "개별 구매")
}
