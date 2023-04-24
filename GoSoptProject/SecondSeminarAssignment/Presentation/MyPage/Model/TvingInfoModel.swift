//
//  TvingInfoModel.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

struct Info {
    let title: String
}

extension Info {
    
    static func dummy() -> [Info] {
        return [
            Info(title: "공지사항"),
            Info(title: "이벤트"),
            Info(title: "고객센터"),
            Info(title: "티빙 알아보기")
        ]
    }
}
