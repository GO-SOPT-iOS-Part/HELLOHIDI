//
//  GenericResponse.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/09.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String?
    var data: T?
}

