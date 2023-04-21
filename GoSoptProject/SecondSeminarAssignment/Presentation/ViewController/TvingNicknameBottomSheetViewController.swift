//
//  TvingNicknameBottomSheetViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

protocol NickNameButtonDidTap: AnyObject {
    func dataBind(nickName: String)
}

final class TvingNicknameBottomSheetViewController: BaseViewController {
    
    private let rootView = TvingNicknameBottomSheetView()
    
    weak var delegate: NickNameButtonDidTap?
    
    override func loadView() {
        self.view = rootView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first,
           touch.view == self.view {
            self.dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    private func target() {
        rootView.nickNameButton.addTarget(self, action: #selector(nickNameButtonDidTap), for: .touchUpInside)
    }
    
    @objc func nickNameButtonDidTap() {
        dismissTvingNicknameBottomSheetViewController()
    }
}

extension TvingNicknameBottomSheetViewController {
    func presentBottomSheet(height: CGFloat) {
        UIView.animate(withDuration: 0.3) { [weak self] in

            guard let self else { return }
            self.rootView.bottomSheetView.snp.updateConstraints {
                $0.height.equalTo(height)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func dismissTvingNicknameBottomSheetViewController() {
        if !rootView.nickNameTextField.isEmpty() {
            guard let nickName = rootView.nickNameTextField.text else { return }
            if validCheck(nickName: nickName) {
                delegate?.dataBind(nickName: nickName)
                self.dismiss(animated: true)
            }
        } else {
            showToast(message: "닉네임을 입력해주세여!", font: .tvingToastMessage)
        }
    }
    
    func validCheck(nickName: String) -> Bool{
        if !nickName.isOnlyKorean() {
            showToast(message: "닉네임은 한글만 입력이 가능합니다!", font: .tvingToastMessage)
            return false
        }
        return true
    }
}


