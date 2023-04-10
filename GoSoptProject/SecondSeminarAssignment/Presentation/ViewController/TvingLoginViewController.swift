//
//  TvingLoginViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

final class TvingLoginViewController: BaseViewController {
    
    private let rootView = TvingLoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    private func target() {
        rootView.passwordTextField.delegate = self
        rootView.idTextField.delegate = self
        
        rootView.securityButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func securityButtonDidTap() {
        disableSecureEntry()
    }
}

extension TvingLoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.placeholder! {
        case "아이디":
            rootView.idTextField.layer.borderColor = UIColor.tvingGray2.cgColor
        case "비밀번호":
            rootView.cleanButton.isHidden = false
            rootView.securityButton.isHidden = false
            rootView.passwordTextField.layer.borderColor = UIColor.tvingGray2.cgColor
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(rootView.passwordTextField.isEmpty())
        changeButtonColor()
    }
}

extension TvingLoginViewController {
    private func disableSecureEntry() {
        rootView.passwordTextField.isSecureTextEntry = false
    }
    
    private func changeButtonColor() {
        if !(rootView.idTextField.isEmpty() || rootView.passwordTextField.isEmpty()) {
            rootView.loginButton.backgroundColor = .tvingRed
        }
    }
}
