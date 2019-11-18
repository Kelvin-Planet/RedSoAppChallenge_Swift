//
//  BannerCell.swift
//  RedSoAppChallenge
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit
import SnapKit

class BannerCell: UITableViewCell {
    var bannerImage = UIImageView()
    var c:Constraint!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.black
        self.addSubview(bannerImage)
        self.bannerImage.snp.remakeConstraints({ make in
            make.edges.equalToSuperview()
            c = make.height.equalTo(0).offset(0).priority(999).constraint
        })
        self.bannerImage.contentMode = .scaleAspectFit
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
