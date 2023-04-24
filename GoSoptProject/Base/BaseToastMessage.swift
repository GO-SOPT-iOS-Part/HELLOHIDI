//
//  BaseToastMessage.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/21.
//

enum ToastMessageType {
    case nothing
    case isEmptyNickName
    case unContainsKorean
    case inValidEmail
    case inValidPassword
}

extension ToastMessageType {
    var message: String {
        switch self {
        case .nothing:
            return ""
        case .isEmptyNickName:
            return "🙏닉네임을 입력해주세요🙏"
        case .inValidPassword:
            return "🙏비밀번호의 형식을 맞춰주세요🙏"
        case .unContainsKorean:
            return "🙏닉네임은 한글로 설정하셔야 합니다.🙏"
        case .inValidEmail:
            return "🙏아이디는 이메일 형식으로 맞춰주세요🙏"
        }
    }
}

final class ToastMessage {
    public var message = ""
    public lazy var type: ToastMessageType = .nothing {
        didSet {
            self.message = type.message
        }
    }
    
    init(toastMessage: ToastMessageType) {
        self.type = toastMessage
    }
}







