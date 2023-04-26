//
//  Content.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/26.
//

import UIKit

struct Content {
    var image: UIImage
    var title: String
}

extension Content {
    static func dummy() -> [Content] {
        return [
            Content(image: Image.poster, title: "너의이름은"),
            Content(image: Image.poster, title: "너의이름은"),
            Content(image: Image.poster, title: "너의이름은"),
            Content(image: Image.poster, title: "너의이름은"),
            Content(image: Image.poster, title: "너의이름은"),
            Content(image: Image.poster, title: "너의이름은")
        ]
    }
}

