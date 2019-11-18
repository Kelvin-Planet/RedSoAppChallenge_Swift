//
//  TabBarView.swift
//  RedSoTest01
//
//  Created by Wai Lee on 16/11/2019.
//  Copyright © 2019 Wai Lee. All rights reserved.
//

import UIKit

class TabBarView: UIView {

    var list = [UILabel(fontSize: KEY_FONT_SIZE, color: UIColor.white, str: "Rangers"),
                UILabel(fontSize: KEY_FONT_SIZE, color: UIColor.white, str: "Elastic"),
                UILabel(fontSize: KEY_FONT_SIZE, color: UIColor.white, str: "Dynamo")]
    var redLine:UIView!
    var didTap:((Int)->())!
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        var holder:UIView!
        for index in 0 ..< list.count {
            let tabItem = list[index]
            self.addSubview(tabItem)
            tabItem.snp.makeConstraints({ make in
                if holder == nil {
                    make.leading.equalToSuperview().offset(KEY_MARGIN)
                }else{
                    make.leading.equalTo(holder.snp.trailing).offset(KEY_MARGIN)
                }
                make.top.bottom.equalToSuperview()
            })
            holder = tabItem
            tabItem.tag = index
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
            tabItem.addGestureRecognizer(tap)
            tabItem.isUserInteractionEnabled = true
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if redLine == nil {
            redLine = UIView()
            self.addSubview(redLine)
            redLine.backgroundColor = UIColor.red
            setActiveIndex(index: 0)
        }
    }
    
    func setActiveIndex(index:Int) {
        UIView.animate(withDuration: 0.3, animations: {
            self.redLine.frame = CGRect(x: self.list[index].frame.origin.x,
                                   y: self.list[index].frame.origin.y+self.list[index].frame.size.height-6,
                                   width: self.list[index].frame.size.width,
                                   height: 6)
        })
    }
    
    @objc func onTap(_ sender: UITapGestureRecognizer) {
        let tag = sender.view!.tag
        self.didTap(tag)
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
