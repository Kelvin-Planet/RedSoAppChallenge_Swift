//
//  HomeViewController.swift
//  RedSoTest01
//
//  Created by Wai Lee on 15/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    let contentView = ContentView()
    let contents = [ContentView()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor.black
        
        let headerLogo = TitleView()
        self.view.addSubview(headerLogo)
        headerLogo.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(statusBarH)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        })
        
        let tapBar = TabBarView()
        self.view.addSubview(tapBar)
        tapBar.snp.makeConstraints({ make in
            make.top.equalTo(headerLogo.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        })
        tapBar.didTap = {
            index in
            tapBar.setActiveIndex(index: index)
            self.contents[0].changeTab(index: index)
        }
        
        let sv = UIScrollView()
        self.view.addSubview(sv)
        sv.snp.makeConstraints({ make in
            make.top.equalTo(tapBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        })
        sv.isPagingEnabled = true
        sv.delegate = self
        
        let cv = UIView()
        sv.addSubview(cv)
        cv.snp.makeConstraints({ make in
            make.top.equalTo(tapBar.snp.bottom)
            make.bottom.equalTo(self.view)
            make.leading.equalTo(sv)
            make.trailing.equalTo(sv)
        })
        
        var holder:UIView!
        for one in contents {
            cv.addSubview(one)
            one.snp.makeConstraints({ make in
                if holder == nil {
                    make.leading.equalToSuperview()
                }else{
                    make.leading.equalTo(holder.snp.trailing)
                }
                make.width.equalTo(sw)
                make.top.bottom.equalToSuperview()
            })
            holder = one
        }
        
        holder.snp.makeConstraints({ make in
            make.trailing.equalToSuperview()
        })
        
        contents[0].loadData()
        
//        self.view.addSubview(contentView)
//        contentView.snp.makeConstraints({ make in
//            make.top.equalTo(tapBar.snp.bottom)
//            make.leading.trailing.bottom.equalToSuperview()
//        })
//
//        contentView.loadData()
        
    }
    

    
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.currentPage
        print("scrollViewDidEndDecelerating: \(currentPage)")
    }
}

extension UIScrollView {
    var currentPage: Int {
        return Int((self.contentOffset.x + (0.5*self.frame.size.width))/self.frame.width)+1
    }
}
