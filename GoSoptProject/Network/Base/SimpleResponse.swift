//
//  SimpleResponse.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/09.
//

import Foundation

struct SimpleResponse: Codable {
    var status: Int
    var success: Bool
    var message: String?
}
