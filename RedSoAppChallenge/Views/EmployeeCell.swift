//
//  EmployeeCell.swift
//  RedSoAppChallenge
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    var profilePic = UIImageView()
    var lbName = UILabel(fontSize: KEY_FONT_SIZE, color: UIColor.white)
    var lbPosition = UILabel(fontSize: KEY_FONT_SIZE, color: UIColor.white)
    var lbExpertise = UILabel(fontSize: KEY_FONT_SIZE, color: UIColor.white)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.black
        self.contentView.addSubview(profilePic)
        profilePic.snp.makeConstraints({ make in
            make.leading.equalToSuperview().offset(KEY_MARGIN)
            make.top.equalToSuperview().offset(KEY_MARGIN)
            make.width.height.equalTo(80)
        })
        profilePic.layer.cornerRadius = 40
        profilePic.layer.masksToBounds = true
        self.contentView.addSubview(lbName)
        lbName.snp.makeConstraints({ make in
            make.leading.equalTo(profilePic.snp.trailing).offset(KEY_MARGIN)
            make.top.equalToSuperview().offset(KEY_MARGIN)
            make.trailing.equalToSuperview().offset(-KEY_MARGIN)
        })
        lbName.numberOfLines = 0
        lbName.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(lbPosition)
        lbPosition.snp.makeConstraints({ make in
            make.leading.equalTo(profilePic.snp.trailing).offset(KEY_MARGIN)
            make.top.equalTo(lbName.snp.bottom).offset(KEY_MARGIN)
            make.trailing.equalToSuperview().offset(-KEY_MARGIN)
        })
        lbPosition.numberOfLines = 0
        lbPosition.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(lbExpertise)
        lbExpertise.snp.makeConstraints({ make in
            make.leading.equalTo(profilePic.snp.trailing).offset(KEY_MARGIN)
            make.top.equalTo(lbPosition.snp.bottom).offset(KEY_MARGIN)
            make.trailing.equalToSuperview().offset(-KEY_MARGIN)
            make.bottom.equalToSuperview().offset(-KEY_MARGIN*2)
        })
        lbExpertise.numberOfLines = 0
        lbExpertise.lineBreakMode = .byWordWrapping
    }
    
    func setData(data:EmployeeModel){
        self.lbName.text = data.name
        self.lbPosition.text = data.position
        self.lbExpertise.text = data.expertise.joined(separator: ", ")
        self.profilePic.kf.setImage(with: URL(string: data.avatar))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
