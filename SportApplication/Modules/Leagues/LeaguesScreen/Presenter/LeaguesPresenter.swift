//
//  LeaguesPresenter.swift
//  SportApplication
//
//  Created by Rana on 5/13/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
class LeaguesPresenter:LeaguesProtocol{

    func getLeagues(url:String,completionHandler: @escaping (LeaguesResualt?, Error?) -> ()){
        let network = LeaguesNetworkManager(baseUrl: url)
        network.getLeagues(completionHandler: { leagues, error in

                         if let error = error {
                             print(error)
                            completionHandler(nil,Error.self as? Error)
                         } else {
                             guard let resualt = leagues else { return }
                            completionHandler(resualt,nil)
                         }
                     })
        
    }
}
protocol LeaguesProtocol {
    func getLeagues(url:String,completionHandler: @escaping (LeaguesResualt?, Error?) -> ())
}