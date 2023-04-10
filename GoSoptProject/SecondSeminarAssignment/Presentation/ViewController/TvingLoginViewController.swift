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
        
        rootView.securityButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func securityButtonDidTap() {
        disableSecureEntry()
    }
}

extension TvingLoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        rootView.cleanButton.isHidden = false
        rootView.securityButton.isHidden = false
    }
}

extension TvingLoginViewController {
    private func disableSecureEntry() {
        rootView.passwordTextField.isSecureTextEntry = false
    }
}
