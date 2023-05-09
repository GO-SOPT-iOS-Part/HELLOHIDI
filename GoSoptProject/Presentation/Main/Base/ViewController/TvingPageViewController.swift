//
//  TvingPageViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/04.
//

import UIKit

import SnapKit
import Then

final class TvingPageViewController: UIPageViewController {
    // 하나의 배열로 묶어준다.
    
    public let tvingMainViewModel: TvingMainViewModel
    
    public let tvingHomeViewController = TvingHomeViewController()
    public let tvingStreamingViewController = TvingStreamingViewController()
    public let tvingTVProgramViewController = TvingTVProgramViewController()
    public let tvingMovieViewController = TvingMovieViewController()
    public let tvingParamountViewController = TvingParamountViewController()
    
    lazy var tvingMainViewControllers = [
        tvingHomeViewController,
        tvingStreamingViewController,
        tvingTVProgramViewController,
        tvingMovieViewController,
        tvingParamountViewController
    ]
    
    init(tvingMainViewModel: TvingMainViewModel) {
        self.tvingMainViewModel = tvingMainViewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setControllers()
    }
    
    func setControllers(index: Int = 0, direction: UIPageViewController.NavigationDirection = .forward) {
        let firstTvingPageViewController = tvingMainViewControllers[index]
        
        self.setViewControllers(
            [firstTvingPageViewController],
            direction: direction,
            animated: true,
            completion: nil
        )
    }
}
