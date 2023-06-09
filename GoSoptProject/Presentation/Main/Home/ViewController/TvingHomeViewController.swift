//
//  TvingHomeViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

protocol HomeViewScroll: AnyObject {
    func steakyHeader(_ part: Int)
}

final class TvingHomeViewController: BaseViewController {
    
    //MARK: - Properties
    
    private var nowPlayingContent: MovieResponse?
    private var popularContent: PopularMovieResponse?
    
    weak var delegate: HomeViewScroll?
    
    //MARK: - UI Components
    
    public let rootView = TvingHomeView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestMovieAPI()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.tvingHomeView.delegate = self
        rootView.tvingHomeView.dataSource = self
    }
    
    //MARK: - Action Method
    
}
extension TvingHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 498)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 210)
        case 2:
            return CGSize(width: UIScreen.main.bounds.width, height: 500)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0)
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        default:
            return UIEdgeInsets()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollY = scrollView.contentOffset.y
        switch scrollY {
        case 0...20:
            delegate?.steakyHeader(0)
        case 20...68:
            delegate?.steakyHeader(1)
        case 60...200:
            delegate?.steakyHeader(2)
        case 400...:
            delegate?.steakyHeader(3)
        default:
            break
        }
    }
}

extension TvingHomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingHomePosterSectionCell.cellIdentifier, for: indexPath) as? TvingHomePosterSectionCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingContentSectionCell.cellIdentifier, for: indexPath) as? TvingContentSectionCell else { return UICollectionViewCell() }
            cell.dataBind(nowPlayingContent)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingPopularChannelSectionCell.cellIdentifier, for: indexPath) as? TvingPopularChannelSectionCell else { return UICollectionViewCell() }
            cell.dataBind(popularContent)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension TvingHomeViewController {
    func requestMovieAPI() {
        HomeAPI.shared.getNowPlaying(request: MovieRequest(api_key: Config.api, language: "en-US", page: 1), completion: { result in
            guard let result = self.validateResult(result) as? MovieResponse else {
                return
            }
            self.nowPlayingContent = result
            self.rootView.tvingHomeView.reloadData()
        })
        HomeAPI.shared.getPopular(request: PopularMovieRequest(api_key: Config.api, language: "en-US", page: 1), completion: { result in
            guard let result = self.validateResult(result) as? PopularMovieResponse else {
                return
            }
            self.popularContent = result
            self.rootView.tvingHomeView.reloadData()
        })
    }
}
