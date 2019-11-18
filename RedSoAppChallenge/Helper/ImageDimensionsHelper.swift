//
//  ImageDimensionsHelper.swift
//  RedSoAppChallenge
//
//  Created by Wai Lee on 17/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit

class ImageDimensionsHelper: NSObject {
    class func fetch(models:[CatalogModel], completion:(([CatalogModel])->())) {
        for one in models {
            if one.type == "banner" {
                (one as! BannerModel).image_h = FTImageSize.getImageSizeFromImageURL((one as! BannerModel).url, perferdWidth: sw).height
            }
        }
        completion(models)
    }
}
