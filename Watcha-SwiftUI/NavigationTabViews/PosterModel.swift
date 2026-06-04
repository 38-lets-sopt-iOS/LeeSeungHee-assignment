//
//  PosterModel.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct PosterModel: Identifiable {
    let id = UUID()
    let posterImage : ImageResource
}

extension PosterModel {
    static let mPosters: [PosterModel] = [
        PosterModel(posterImage: .t1),
        PosterModel(posterImage: .b2),
        PosterModel(posterImage: .t2),
        PosterModel(posterImage: .t3),
        PosterModel(posterImage: .t1)
    ]
    
    static let vPosters: [PosterModel] = [
        PosterModel(posterImage: .b3),
        PosterModel(posterImage: .b1),
        PosterModel(posterImage: .b3),
        PosterModel(posterImage: .b1)
    ]
    
    static let posters: [PosterModel] = [
        PosterModel(posterImage: .t1),
        PosterModel(posterImage: .t2),
        PosterModel(posterImage: .t3),
        PosterModel(posterImage: .t1)
    ]
}


struct PartyModel: Identifiable {
    let id = UUID()
    let posterImage : ImageResource
    let posterTag: String
    let posterTime: String
    
    static let partyPosters: [PartyModel] = [
        PartyModel(posterImage: .p1, posterTag: "# 왕가남", posterTime: "오늘 21:30에 시작"),
        PartyModel(posterImage: .p2, posterTag: "# 파묘", posterTime: "오늘 22:45에 시작")
    ]
}



