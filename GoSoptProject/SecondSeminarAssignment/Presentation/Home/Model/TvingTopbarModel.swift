//
//  TvingTopbarModel.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

struct TopBar {
    let title: String
    let isTapped: Bool
}

extension TopBar {
    static func dummy() -> [TopBar] {
        return [
            TopBar(title: "홈", isTapped: true),
            TopBar(title: "실시간", isTapped: true),
            TopBar(title: "TV프로그램", isTapped: true),
            TopBar(title: "영화", isTapped: true),
            TopBar(title: "파라마운트", isTapped: true),
        ]
    }
}
