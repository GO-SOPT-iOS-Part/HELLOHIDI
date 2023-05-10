//
//  HomeAPI.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/05/09.
//

import Foundation

import Alamofire

class HomeAPI: BaseAPI {
    static let shared = HomeAPI()

    private override init() {}
}

extension HomeAPI{
    
    public func getNowPlaying(request: ContentRequest ,completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(HomeService.getNowPlaying(request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: ContentResponse.self,
                                completion: completion)
        }
    }
}
