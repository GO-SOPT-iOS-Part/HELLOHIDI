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
    
    
    //MARK: - Properties
    
    private var nickName: String = ""
    private let rootView = TvingLoginView()
    
    //MARK: - Life Cycles
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.passwordTextField.delegate = self
        rootView.idTextField.delegate = self
        
        rootView.passwordTextField.addTarget(self, action: #selector(updateLoginButton(textField:)), for: .editingChanged)
        rootView.idTextField.addTarget(self, action: #selector(updateLoginButton(textField:)), for: .editingChanged)
        
        
        rootView.securityButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
        rootView.clearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.signUpButton.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
    }
    
    //MARK: - Action Method
    
    @objc private func securityButtonDidTap() {
        disableSecureEntry()
    }
    
    @objc private func clearButtonDidTap() {
        clearTextField()
    }
    
    @objc private func loginButtonDidTap() {
        validCheck()
    }
    
    @objc private func signUpButtonDidTap() {
        pushToTvingNickNameBottomSheetView()
    }
}

extension TvingLoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let authTextField = textField as? TvingAuthTextField else { return }
        
        switch authTextField.textFieldType {
        case .id:
            rootView.idTextField.layer.borderColor = UIColor.tvingGray2.cgColor
        case .password:
            rootView.clearButton.isHidden = false
            rootView.securityButton.isHidden = false
            rootView.passwordTextField.layer.borderColor = UIColor.tvingGray2.cgColor
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
        rootView.passwordTextField.text = ""
        rootView.loginButton.isEnabled = false
        rootView.loginButton.backgroundColor = .tvingBlack
        rootView.clearButton.isHidden = true
        rootView.securityButton.isHidden = true
    }
    
    func pushToTvingWelcomeView(id: String) {
        let tvingWelcomeViewController = TvingWelcomeViewController()
        tvingWelcomeViewController.dataBind(id: id)
        
        self.navigationController?.pushViewController(tvingWelcomeViewController, animated: true)
    }
    
    func pushToTvingNickNameBottomSheetView() {
        let tvingNicknameBottomSheetViewController = TvingNicknameBottomSheetViewController()
        tvingNicknameBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        
        tvingNicknameBottomSheetViewController.delegate = self
        self.present(tvingNicknameBottomSheetViewController, animated: true) {
            tvingNicknameBottomSheetViewController.presentBottomSheet(height: UIScreen.main.bounds.height * 0.5)
        }
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
            pushToTvingWelcomeView(id: id)
        }
    }
}

extension TvingLoginViewController: NickNameButtonDidTap {
    func dataBind(nickName: String) {
        self.nickName = nickName
    }
}
