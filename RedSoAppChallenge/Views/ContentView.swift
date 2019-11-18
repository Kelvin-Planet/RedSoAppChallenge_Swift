//
//  ContentView.swift
//  RedSoAppChallenge
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit

class ContentView: UIView {

    var teams = ["rangers","elastic","dynamo"];
    var selectedTeamIndex:Int = 0
    var loadingPage:Int = 0
    
    var data = [CatalogModel]()
    let tableView = UITableView()
    var refreshControl:UIRefreshControl!
    let loadingView = UILabel(fontSize: 18, color: UIColor.white, str: "Loading...")
    var isLoading:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        tableView.register(EmployeeCell.classForCoder(), forCellReuseIdentifier: "EmployeeCell")
        tableView.register(BannerCell.classForCoder(), forCellReuseIdentifier: "BannerCell")

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        tableView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        tableView.backgroundColor = UIColor.black
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(reloadData), for: UIControlEvents.valueChanged)
        
        self.addSubview(loadingView)
        loadingView.snp.makeConstraints({ make in
            make.centerX.equalTo(tableView)
            make.top.equalTo(tableView).offset(30)
        })
        loadingView.textAlignment = .center
        loadingView.isHidden = true
        
        
    }
    
    func changeTab(index:Int) {
        self.selectedTeamIndex = index
        self.loadingPage = 0
        self.data.removeAll()
        self.tableView.reloadData()
        self.loadingView.isHidden = self.data.count > 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadData()
        }
    }
    
    @objc func reloadData() {
        self.loadData(isReload: true)
    }
    
    func loadData(isReload:Bool=false) {
        self.loadingView.isHidden = self.data.count > 0
        if isReload {
            self.loadingPage = 0
        }
        self.isLoading = true
        APIHelper.loadCatalog(withTeam: self.teams[self.selectedTeamIndex], page: self.loadingPage, completion: {
            result in
            if result.count > 0 {
                self.loadingPage += 1
                if isReload {
                    self.data = result
                }else{
                    self.data += result
                }
                self.tableView.reloadData()
                self.loadingView.isHidden = self.data.count > 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
                self.refreshControl.endRefreshing()
            }
        }, fail: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
            }
        })
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

extension ContentView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection secion: Int) -> Int {
        return self.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let one = self.data[indexPath.row]
        if one.type == "banner" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            cell.bannerImage.kf.setImage(with: URL(string: (one as! BannerModel).url))
            cell.c.update(offset: (one as! BannerModel).image_h)
            return cell
        }
        else if one.type == "employee" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCell
            cell.selectionStyle = .none
            cell.setData(data: one as! EmployeeModel)
            return cell
        }
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height + bottomPadding + 20 {
            if !self.isLoading {
                self.loadData()
            }
        }
    }
    
}
