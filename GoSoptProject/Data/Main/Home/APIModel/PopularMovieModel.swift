//
//  ChannelModel.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/28.
//

import UIKit

struct Channel {
    var image: UIImage
    var rank: String
    var title: String
    var subTitle: String
    var rating: String
    
}

extension Channel {
    static func dummy() -> [Channel] {
        return [
            Channel(image: Image.poster1, rank: "1", title: "하트시그널", subTitle: "하트시그널", rating: "80.0%"),
            Channel(image: Image.poster2, rank: "2", title: "하트시그널", subTitle: "하트시그널", rating: "80.0%"),
            Channel(image: Image.poster3, rank: "3", title: "하트시그널", subTitle: "하트시그널", rating: "80.0%"),
            Channel(image: Image.poster4, rank: "4", title: "하트시그널", subTitle: "하트시그널", rating: "80.0%"),
            Channel(image: Image.poster1, rank: "5", title: "하트시그널", subTitle: "하트시그널", rating: "80.0%"),
            Channel(image: Image.poster2, rank: "6", title: "하트시그널", subTitle: "하트시그널", rating: "80.0%"),
        ]
    }
}

