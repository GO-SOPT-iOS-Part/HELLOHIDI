//
//  GenericResponse.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/09.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var status_code: Int?
    var success: Bool?
    var status_message: String?
    var data: T?
}

