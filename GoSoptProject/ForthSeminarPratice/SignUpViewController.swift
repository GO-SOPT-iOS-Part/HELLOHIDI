//
//  ViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/06.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "seungchan@naver.com",
                                    nickname: "godios",
                                    password: "Qwer1234!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
