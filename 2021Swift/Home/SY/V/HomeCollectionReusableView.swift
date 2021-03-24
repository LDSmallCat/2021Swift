//
//  HomeCollectionReusableView.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/4.
//

import UIKit

class HomeCollectionReusableView: BaseCollectionReusableView {
    private let titleArray = ["核酸检测","浦东新区","黑龙江省","哈尔滨市"]
    private let imageArray = ["icon_loan_application","icon_loan_contract","icon_data_upload","icon_heavy_contract"]
    
    private lazy var bannerView: LLCycleScrollView = {
        let bv = LLCycleScrollView()
        bv.backgroundColor = UIColor.background
        bv.autoScrollTimeInterval = 6
        bv.placeHolderImage = UIImage(named: "normal_placeholder_h")
        bv.coverImage = UIImage()
        bv.pageControlPosition = .right
        bv.pageControlBottom = 20
        bv.titleBackgroundColor = UIColor.clear
        bv.lldidSelectItemAtIndex = didSelectBanner(index:)
        bv.imagePaths = imageUrlArray
        return bv
    }()
    
    
    private lazy var backView: UIImageView = {
        let bv = UIImageView()
        bv.isUserInteractionEnabled = true
        bv.layer.cornerRadius = 4
        bv.backgroundColor = UIColor.white
        return bv
    }()


    
    func addSubViews(titleArray: Array<String>,imageArray: Array<String>) {
        let margen: CGFloat = 13
        let y: CGFloat = 15
        let  w_h: CGFloat = 45
        let currentReferenceWidth = screenWidth - 2 * margen
        
        var  insideMargen: CGFloat = ld_scaleWidth(margen, 355, currentReferenceWidth)
        if screenWidth > 376 { insideMargen = 25 }
        
        let padding: CGFloat = (currentReferenceWidth - 2 * insideMargen - 4 * w_h) / 3
        
        for index in 0 ..< titleArray.count {
            
            let ix = CGFloat(index)
            
            let iv = UIImageView()
            let x: CGFloat = insideMargen + (padding * ix) + (w_h * ix);
            iv.frame = CGRect(x: x, y: y, width: w_h, height: w_h)
            //iv.backgroundColor = UIColor.random
            iv.image = UIImage(named: imageArray[index])
            backView.addSubview(iv)
            
            let lb = UILabel()
            lb.font = UIFont.systemFont(ofSize: 13)
            lb.textColor = UIColor.textBlackColor
            lb.textAlignment = .center
            //lb.backgroundColor = UIColor.random
            lb.text = titleArray[index]
            backView.addSubview(lb)
            
            lb.mas_makeConstraints{
                $0?.centerX.equalTo()(iv)
                $0?.top.equalTo()(iv.mas_bottom)?.offset()(10)
            }
            
            
        }
        
    }
    override func configUI() {
        self.backgroundColor = UIColor.background
        addSubview(bannerView)
        
        addSubview(backView)
        addSubViews(titleArray: titleArray, imageArray: imageArray)
        
    }
    
    
    override func configLayout() {
        bannerView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
        }
        backView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(100)
        }
        
    }
}

extension HomeCollectionReusableView {
    func didSelectBanner(index: Int) {
       print("点击index = " + "\(index)")
    }
}
