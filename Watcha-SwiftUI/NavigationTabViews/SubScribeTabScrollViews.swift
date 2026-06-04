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
                    }
                }
            }
            .onAppear {
                startPoint.scrollTo(PosterModel.mPosters[1].id, anchor: .center)
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
                    }
                }
            }
            .onAppear {
                startPoint.scrollTo(PosterModel.vPosters[1].id, anchor: .center)
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
                
                ForEach(PartyModel.partyPosters) { poster in
                    ZStack (alignment: .top) {
                        Rectangle()
                            .frame(width: 196,height:185)
                            .foregroundStyle(.GRAY_600)
                        
                        VStack {
                            Image(poster.posterImage)
                                .resizable()
                                .frame(width: 196, height: 139)
                                .padding(.bottom,3)
                            
                            HStack{
                                VStack(alignment: .leading) { Text(poster.posterTime)
                                    .font(.body1)
                                    .foregroundStyle(.WATCHA_PINK)
                                    .padding(.bottom,3)
                                    
                                    Text(poster.posterTag)
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
