//
//  SubscribeViewController.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct SubscribeTabView: View {
    
    var body: some View {
        
        ZStack {
            Color.WATCHA_BLACK
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack (alignment: .leading) {
                    VStack {
                        HStack(spacing: 20) {
                            
                            Spacer()
                            
                            Image(.video)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Image(.notification)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Image(.profile)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        
                        HStack {
                            Text("구독")
                                .font(.head1)
                                .foregroundStyle(.WATCHA_WHITE)
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                    }
                    
                    Rectangle()
                        .fill(.GRAY_600)
                        .frame(height: 2)
                    
                    VStack (spacing:15) {
                        
                        mainStack()
                            .padding(.bottom,30)
                        
                        HStack{
                            
                            VStack(alignment: .leading) {
                                
                                Text("방금 막 도착한 신상 컨텐츠")
                                    .font(.head3)
                                    .foregroundStyle(.WATCHA_WHITE)
                                
                                Text("예능부터 드라마까지!")
                                    .font(.subhead1)
                                    .foregroundStyle(.GRAY_200)
                            }
                            Spacer()
                        }
                        .padding(.leading, 24)
                        
                        verticalStack()
                            .padding(.bottom,30)
                        
                        HStack{
                            VStack(alignment: .leading) {
                                
                                Image(.watgorythm)
                                
                                Text("예능부터 드라마까지!")
                                    .font(.subhead1)
                                    .foregroundStyle(.WATCHA_WHITE)
                            }
                            Spacer()
                            
                            Text("더보기")
                                .font(.cap1)
                                .foregroundStyle(.GRAY_100)
                                .padding(.trailing,22)
                        }
                        .padding(.leading, 22)
                        
                        posterStack()
                            .padding(.leading,18)
                            .padding(.bottom,30)
                        
                        HStack{
                            
                            Text("공개예정 콘텐츠")
                                .font(.head3)
                                .foregroundStyle(.WATCHA_WHITE)
                            Spacer()
                            
                            Text("더보기")
                                .font(.cap1)
                                .foregroundStyle(.GRAY_100)
                                .padding(.trailing,22)
                        }
                        .padding(.leading, 24)
                        
                        posterStack()
                            .padding(.leading,18)
                            .padding(.bottom,30)
                        
                        HStack{
                            
                            Text("왓챠파티")
                                .font(.head3)
                                .foregroundStyle(.WATCHA_WHITE)
                            Spacer()
                            
                            Text("더보기")
                                .font(.cap1)
                                .foregroundStyle(.GRAY_100)
                                .padding(.trailing,22)
                        }
                        .padding(.leading, 22)
                        
                        partyStack()
                            .padding(.leading,17)
                    }
                }
            }
        }
    }
}

#Preview {
    SubscribeTabView()
}
