//
//  TvingSettingModel.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

struct Setting {
    let title: String
}

extension Setting {
    
    static func dummy() -> [Setting] {
        return [
            Setting(title: "이용권"),
            Setting(title: "1:1 문의내역"),
            Setting(title: "예약알림"),
            Setting(title: "회원정보 수정"),
            Setting(title: "프로모션 정보 수신 동의")
        ]
    }
}
