//
//  TvingNicknameBottomSheetViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

final class TvingNicknameBottomSheetViewController: BaseViewController {
    
    private let rootView = TvingNicknameBottomSheetView()
    
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
        
        setUI()
        target()
    }
    
    private func setUI() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    private func target() {
        
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
}


