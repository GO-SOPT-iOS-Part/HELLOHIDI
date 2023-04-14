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
        
        rootView.passwordTextField.addTarget(self, action: #selector(updateLoginButton(textField:)), for: .editingChanged)
        rootView.idTextField.addTarget(self, action: #selector(updateLoginButton(textField:)), for: .editingChanged)
        
        
        rootView.securityButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
        rootView.clearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func securityButtonDidTap() {
        disableSecureEntry()
    }
    
    @objc private func clearButtonDidTap() {
        clearTextField()
    }
    
    @objc private func loginButtonDidTap() {
        validCheck()
    }
}

extension TvingLoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.placeholder! {
        case "아이디":
            rootView.idTextField.layer.borderColor = UIColor.tvingGray2.cgColor
        case "비밀번호":
            rootView.clearButton.isHidden = false
            rootView.securityButton.isHidden = false
            rootView.passwordTextField.layer.borderColor = UIColor.tvingGray2.cgColor
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        rootView.idTextField.layer.borderColor = UIColor.tvingGray4.cgColor
        rootView.passwordTextField.layer.borderColor = UIColor.tvingGray4.cgColor
    }
    
}

private extension TvingLoginViewController {
    func disableSecureEntry() {
        rootView.passwordTextField.isSecureTextEntry = false
    }
    
    @objc func updateLoginButton(textField: UITextField) {
        if !(rootView.idTextField.isEmpty() || rootView.passwordTextField.isEmpty()) {
            rootView.loginButton.isEnabled = true
            rootView.loginButton.backgroundColor = .tvingRed
        } else {
            rootView.loginButton.isEnabled = false
            rootView.loginButton.backgroundColor = .tvingBlack
        }
    }
    
    func clearTextField() {
        if !rootView.passwordTextField.isEmpty() {
            rootView.passwordTextField.text = ""
            rootView.loginButton.isEnabled = false
            rootView.loginButton.backgroundColor = .tvingBlack
        }
    }
    
    func pushToTvingWelcomeView() {
        let tvingWelcomeViewController = TvingWelcomeViewController()
        self.navigationController?.pushViewController(tvingWelcomeViewController, animated: true)
    }
    
    
    func validCheck() {
        guard let id = rootView.idTextField.text else { return }
        guard let password = rootView.passwordTextField.text else { return }
        
        if !id.isValidEmail() {
            showToast(message: "아이디의 형식이 일치하지 않습니다", font: .tvingToastMessage)
        } else if !password.isContainNumberAndAlphabet() {
            showToast(message: "비밀번호의 형식이 일치하지 않습니다", font: .tvingToastMessage)
        } else {
            showToast(message: "로그인 성공!", font: .tvingToastMessage)
            pushToTvingWelcomeView()
        }
        
    }
}
