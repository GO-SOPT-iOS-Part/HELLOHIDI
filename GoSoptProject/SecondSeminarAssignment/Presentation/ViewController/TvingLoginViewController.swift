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
}

