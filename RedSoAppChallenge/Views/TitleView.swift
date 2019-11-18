//
//  TitleView.swift
//  RedSoTest01
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit

class TitleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        let icon = UIImageView(image: UIImage(named: "logo.png"))
        self.addSubview(icon)
        icon.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        icon.contentMode = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
