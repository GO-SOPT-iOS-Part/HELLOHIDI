//
//  TvingNicknameBottomSheetViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

//MARK: NickNameButtonDidTap

protocol NickNameButtonDidTap: AnyObject {
    func dataBind(nickName: String)
}

final class TvingNicknameBottomSheetViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let rootView = TvingNicknameBottomSheetView()
    weak var delegate: NickNameButtonDidTap?
    
    //MARK: - Life Cycle
    
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
    
    //MARK: - Custom Method
    
    private func setUI() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    private func target() {
        rootView.nickNameButton.addTarget(self, action: #selector(nickNameButtonDidTap), for: .touchUpInside)
    }
    
    //MARK: - Action Method
    
    @objc func nickNameButtonDidTap() {
        dismissTvingNicknameBottomSheetViewController()
    }
}

//MARK: - TvingNicknameBottomSheetViewController

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
            toastMessage.type = .isEmptyNickName
            showToast(message: toastMessage.message, font: .tvingToastMessage)
        }
    }
    
    func validCheck(nickName: String) -> Bool{
        if !nickName.ContainsKorean() {
            toastMessage.type = .unContainsKorean
            showToast(message: toastMessage.message, font: .tvingToastMessage)
            return false
        }
        return true
    }
}


