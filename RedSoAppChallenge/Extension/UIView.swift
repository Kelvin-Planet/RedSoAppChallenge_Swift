//
//  UIView.swift
//  RedSoTest01
//
//  Created by Wai Lee on 15/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit

extension UIView {
    func randomBorder() {
        self.layer.borderColor = UIColor.random().cgColor
        self.layer.borderWidth = 3
    }
    func randomBG() {
        self.backgroundColor = UIColor.random()
    }
}
