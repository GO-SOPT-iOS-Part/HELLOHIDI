//
//  TvingTVProgramViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

final class TvingTVProgramViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let rootView = TvingTVProgramView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        
    }
    
    //MARK: - Action Method
    
}

