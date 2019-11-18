//
//  ViewController.swift
//  RedSoAppChallenge
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let nav = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nav.isNavigationBarHidden = true
        self.addChildViewController(nav)
        self.view.addSubview(nav.view)
        nav.didMove(toParentViewController: self)
        nav.view.snp.makeConstraints({ (make)->Void in
            make.edges.equalToSuperview()
        })
        nav.viewControllers = [HomeViewController()]
        
    }


}

