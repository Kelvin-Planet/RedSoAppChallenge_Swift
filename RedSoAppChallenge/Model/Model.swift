//
//  Model.swift
//  RedSoAppChallenge
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit
import SwiftyJSON

class CatalogModel {
    var type:String = ""
}

class BannerModel: CatalogModel {
    var url:String = ""
    var image_h:CGFloat = 0.0
    init(data:JSON) {
        super.init()
        self.type = "banner"
        if let url = data["url"].string {
            self.url = url
        }
    }
}

class EmployeeModel: CatalogModel {
    var id:String = ""
    var name:String = ""
    var position:String = ""
    var expertise = [String]()
    var avatar:String = ""
    init(data:JSON) {
        super.init()
        self.type = "employee"
        if let id = data["id"].string {
            self.id = id
        }
        if let name = data["name"].string {
            self.name = name
        }
        if let position = data["position"].string {
            self.position = position
        }
        if let arr = data["expertise"].array {
            for one in arr {
                expertise.append(one.string!)
            }
        }
        if let avatar = data["avatar"].string {
            self.avatar = avatar
        }
    }
    func calculateCellHeight() -> CGFloat {
        var height:CGFloat = 20
        let boxWidth:CGFloat = sw-20-80-20-20
        var lb = UILabel(fontSize: 18, color: UIColor.white, str: self.name)
        height += lb.sizeThatFits(CGSize(width: boxWidth, height: CGFloat.greatestFiniteMagnitude)).height
        height += 20
        lb = UILabel(fontSize: 18, color: UIColor.white, str: self.position)
        height += lb.sizeThatFits(CGSize(width: boxWidth, height: CGFloat.greatestFiniteMagnitude)).height
        height += 20
        lb = UILabel(fontSize: 18, color: UIColor.white, str: self.expertise.joined(separator: ", "))
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        height += lb.sizeThatFits(CGSize(width: boxWidth, height: CGFloat.greatestFiniteMagnitude)).height
        height += 40
        return height
    }
}
