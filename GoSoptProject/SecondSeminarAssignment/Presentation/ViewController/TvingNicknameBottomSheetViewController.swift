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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        target()
    }
    
    private func setUI() {
        view.backgroundColor = .clear
//        view.alpha = 0.45
    }
    
    private func target() {
        
    }
    
}


