//
//  TvingAuthTextFeild.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/17.
//

import UIKit

final class TvingAuthTextField: UITextField {
    
    enum TextFieldType {
        case id
        case password
        
        var isSecureTextEntry: Bool {
            switch self {
            case .id: return false
            case .password: return true
            }
        }
        
        var placeholder: String {
            switch self {
            case .id: return "아이디"
            case .password: return "비밀번호"
            }
        }
    }
    
    public var textFieldType: TextFieldType = .id
    
    init(viewType: TextFieldType = .id) {
        self.textFieldType = viewType
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TvingAuthTextField: UITextFieldDelegate {
    
}
