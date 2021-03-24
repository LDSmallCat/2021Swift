//
//  HomeCollectionViewCell.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/4.
//

import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    lazy var titleArray: Array<String> = ["期限","首付比","客户利率"]
    lazy var subTitleArray: Array<String> = ["18个月",">=50%","35%"]
    
    lazy var labArray = Array<UILabel>()
    lazy var subLabArray: Array<UILabel> = []
    lazy var lineArray = [UIView]()
    
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 2
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textColor = UIColor.textBlackColor
        return lab
    }()
    
    lazy var leftImageView: UIImageView = {
        let im = UIImageView()
        im.layer.cornerRadius = 5
        im.backgroundColor = UIColor.random
        return im
    }()
    
    lazy var backBottomView: UIView = {
        let back = UIView()
        //back.backgroundColor = UIColor.random
        return back
    }()
    
    func addOtherSubViews() {
        
        for index in 0 ..< titleArray.count {
            let title = UILabel()
            title.text = titleArray[index]
            title.font = UIFont.systemFont(ofSize: 12)
            title.textColor = UIColor.textPlaceHolderColor
            //title.backgroundColor = UIColor.random
            backBottomView.addSubview(title)
            labArray.append(title)
            switch index {
            case 0:title.textAlignment = .left
            case 1:title.textAlignment = .center
            case 2:title.textAlignment = .right
            default:break
            }
            
            
            let subTitle = UILabel()
            subTitle.text = subTitleArray[index]
            subTitle.textAlignment = title.textAlignment
            subTitle.font = UIFont.systemFont(ofSize: 12)
            subTitle.textColor = UIColor.textPlaceHolderColor
            //subTitle.backgroundColor = UIColor.random
            backBottomView.addSubview(subTitle)
            subLabArray.append(subTitle)
            
            if index > 0 {
                let line = UIView()
                line.backgroundColor = UIColor.lineColor
                backBottomView.addSubview(line)
                lineArray.append(line)
            }
        }
        
    }
    
    override func configUI() {
        super.configUI()
        line.isHidden = false
        bringSubviewToFront(line)
        addSubview(leftImageView)
        addSubview(titleLabel)
        addSubview(backBottomView)
        addOtherSubViews()
    }
    
    override func configLayout() {
        super.configLayout()
        leftImageView.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.top.left().offset()(10)
            make.width.height()?.offset()(90)
        }
        
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(leftImageView.snp.right).offset(17)
            $0.right.equalToSuperview().offset(-17)
            $0.top.equalTo(leftImageView)
            $0.height.equalTo(45)
        }
        
        backBottomView.snp.makeConstraints {
            $0.left.right.equalTo(titleLabel)
            $0.bottom.equalToSuperview().offset(-1)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        //        along:方向
        //        withFixedItemLength:宽度（宽度固定）
        //        leadSpacing:左边距(上边距)
        //        tailSpacing:右边距(下边距)
        //(subLabArray as NSArray).mas_distributeViews(along: .horizontal, withFixedItemLength: 0.5, leadSpacing: 0, tailSpacing: 0)
        let spacing: CGFloat = (screenWidth - 100 - 17 * 2)/3 - 10.0
        (lineArray as NSArray).mas_distributeViews(along: .horizontal, withFixedItemLength: 0.5, leadSpacing: spacing, tailSpacing: spacing)
        (lineArray as NSArray).mas_makeConstraints { (make :MASConstraintMaker?) in
            make?.top.offset()(3)
            make?.height.offset()(30)
        }
        
        
        //        axisType:方向
        //        fixedSpacing:中间间距
        //        leadSpacing:左边距(上边距)
        //        tailSpacing:右边距(下边距)
        labArray.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 0.5, leadSpacing: 0, tailSpacing: 0)
        //        上面的可以约束x+w,还需要另外约束y+h
        //        约束y和height()如果方向是纵向,那么则另外需要设置x+w
        labArray.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        
        
        //        along:方向
        //        withFixedItemLength:中间间距（间距固定）
        //        leadSpacing:左边距(上边距)
        //        tailSpacing:右边距(下边距)
        (subLabArray as NSArray).mas_distributeViews(along: .horizontal, withFixedSpacing: 0.5, leadSpacing: 0, tailSpacing: 0)
        (subLabArray as NSArray).mas_makeConstraints { (make :MASConstraintMaker?) in
            make?.top.offset()(25)
            make?.bottom.lessThanOrEqualTo()(backBottomView)
        }

        
    }
}
