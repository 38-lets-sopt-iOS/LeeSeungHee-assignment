//
//  PosterModel.swift
//  Watcha-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/29/26.
//

import SwiftUI

struct PosterModel: Identifiable {
    let id: Int
    let posterImage : ImageResource
}

extension PosterModel {
    static let mPosters: [PosterModel] = [
        PosterModel(id: 0, posterImage: .t1),
        PosterModel(id: 1, posterImage: .b2),
        PosterModel(id: 2, posterImage: .t2),
        PosterModel(id: 3, posterImage: .t3),
        PosterModel(id: 4, posterImage: .t1)
    ]
    
    static let vPosters: [PosterModel] = [
        PosterModel(id: 5, posterImage: .b3),
        PosterModel(id: 6, posterImage: .b1),
        PosterModel(id: 7, posterImage: .b3),
        PosterModel(id: 8, posterImage: .b1)
    ]
    
    static let posters: [PosterModel] = [
        PosterModel(id: 9, posterImage: .t1),
        PosterModel(id: 10, posterImage: .t2),
        PosterModel(id: 11, posterImage: .t3),
        PosterModel(id: 12, posterImage: .t1)
    ]
    
    static let pPosters: [PosterModel] = [
        PosterModel(id: 13, posterImage: .p1),
        PosterModel(id: 14, posterImage: .p2),
    ]
}
