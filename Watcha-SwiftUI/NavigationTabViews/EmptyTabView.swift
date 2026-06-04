//
//  EmptyViewController.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct EmptyTabView: View {
    
    let title: String

    var body: some View {
        
        ZStack {
            Color.WATCHA_BLACK
                .ignoresSafeArea()

            VStack(spacing: 50) {
                Text(title)
                    .font(.head2)
                    .foregroundStyle(.WATCHA_WHITE)

                Image("mandoo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                Text(" . . 텅 ~")
                    .font(.head1)
                    .foregroundStyle(.WATCHA_GREEN)
            }
        }
    }
}

#Preview {
    EmptyTabView(title: "개별 구매")
}
