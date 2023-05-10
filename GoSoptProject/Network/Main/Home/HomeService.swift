//
//  HomeService.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/09.
//

import Foundation

import Alamofire

enum HomeService{
    case getNowPlaying(MovieRequest)
    case getPopular(PopularMovieRequest)
}

extension HomeService: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getNowPlaying:
            return .get
        case .getPopular:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getNowPlaying:
            return "now_playing"
        case .getPopular:
            return "popular"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getNowPlaying(let request):
                return .query(request)
        case .getPopular(let request):
                return .query(request)
        }
    }
}


