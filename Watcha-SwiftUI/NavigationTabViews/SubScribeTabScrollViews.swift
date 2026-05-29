//
//  HScrollViews.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct mainStack : View{
    
    var body: some View {
        
        ScrollViewReader { startPoint in
            
            ScrollView(.horizontal) {
                
                HStack(spacing:15){
                    
                    ForEach(PosterModel.mPosters) { poster in
                        Image(poster.posterImage)
                            .resizable()
                            .frame(width: 273, height: 399)
                            .cornerRadius(12)
                            .id(poster.id)
                    }
                }
            }
            .onAppear {
                startPoint.scrollTo(1, anchor: .center)
            }
        }
    }
}

struct verticalStack : View{
    
    var body: some View {
        
        ScrollViewReader { startPoint in
            
            ScrollView(.horizontal) {
                
                HStack(spacing:12){
                    
                    ForEach(PosterModel.vPosters) { poster in
                        Image(poster.posterImage)
                            .resizable()
                            .frame(width: 339, height: 191)
                            .cornerRadius(12)
                            .id(poster.id)
                    }
                }
            }
            .onAppear {
                startPoint.scrollTo(6, anchor: .center)
            }
        }
    }
}

struct posterStack : View {
    
    var body: some View {
        
        ScrollView(.horizontal) {
            
            HStack(spacing:15) {
                
                ForEach(PosterModel.posters) { poster in
                    Image(poster.posterImage)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct partyStack : View {
    
    var body: some View {
        
        ScrollView(.horizontal) {
            
            HStack(spacing:12) {
                
                ForEach(PosterModel.pPosters) { poster in
                    ZStack (alignment: .top) {
                        Rectangle()
                            .frame(width: 196,height:185)
                            .foregroundStyle(.GRAY_600)
                        
                        VStack {
                            Image(poster.posterImage)
                                .resizable()
                                .frame(width: 196, height: 139)
                            
                            HStack{
                                VStack(alignment: .leading) { Text("오늘 22:02에 시작")
                                    .font(.body1)
                                    .foregroundStyle(.WATCHA_PINK)
                                    .padding(.bottom,6)
                                    
                                Text("#왕가사는남자")
                                    .font(.subhead3)
                                .foregroundStyle(.WATCHA_WHITE)}
                                Spacer()
                            }
                            .padding(.leading,8)
                        }
                    }
            
                }
            }
        }
    }
}
