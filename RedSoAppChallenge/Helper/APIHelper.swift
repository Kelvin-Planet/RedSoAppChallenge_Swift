//
//  APIHelper.swift
//  RedSoTest01
//
//  Created by Wai Lee on 15/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class APIHelper: NSObject {
    static var SERVER_API:String = "https://us-central1-redso-challenge.cloudfunctions.net/"
    //static var SERVER_API:String = "http://0.0.0.0:3009/"
    
    class func debugReq(_ request: Request) {
        let isSimulator: Bool = {
            var isSim = false
            #if arch(i386) || arch(x86_64)
            isSim = true
            #endif
            return isSim
        }()
        if isSimulator {
            debugPrint(request)
        }
    }
    class func loadCatalog(withTeam team:String,
                           page:Int,
                           completion:@escaping (([CatalogModel])->()),
                           fail:@escaping (()->())) {
        var parameters = Parameters()
        parameters["team"] = team
        parameters["page"] = page
        let req = Alamofire.request("\(SERVER_API)catalog",
            method: .get,
            parameters: parameters).validate().responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(response.result.value!)
                    var data = [CatalogModel]()
                    if let arr = json["results"].array {
                        for one in arr {
                            if one["type"] == "banner" {
                                data.append(BannerModel(data: one))
                            }
                            if one["type"] == "employee" {
                                data.append(EmployeeModel(data: one))
                            }
                        }
                    }
                    
                    //completion(data)
                    ImageDimensionsHelper.fetch(models: data, completion: {
                        fetched in
                        completion(data)
                    })
                    
                case .failure(let error):
                    print("error - \(error.localizedDescription)")
                    fail()
                }
        }
        debugReq(req)
    }
}
