//
//  HSJCViewController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/3/23.
//

import UIKit

class HSJCViewController: BaseCollectionViewController {
    lazy var titleView: HMSegmentedControl = {
        let seg = HMSegmentedControl(sectionTitles: [
            "全部", "未提交","已提交","被驳回"
        ])
        seg.selectionIndicatorLocation = .bottom
        seg.backgroundColor = UIColor.white
        seg.selectionIndicatorColor = UIColor.hex(hexString: "1B82D2")
        seg.selectionIndicatorEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        return seg
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "城市列表"
        
    }
    
    override func configUI() {
        configNavBarUI()
        view.addSubview(titleView)
        collectionView.register(HSJCCollectionViewCell.self, forCellWithReuseIdentifier: "HSJCCollectionViewCell")
        view.addSubview(collectionView)
    }
    override func configLayout() {
        titleView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
            $0.top.equalToSuperview().offset(navigationBarAreaHeight)
        }
        collectionView.snp.makeConstraints{
            $0.bottom.left.right.equalToSuperview()
            $0.top.equalTo(titleView.snp.bottom)
        }
    }
    //MARK: - 导航栏UI
    func configNavBarUI() {
        
        let delete = UIBarButtonItem(norImage: "search_history_delete", selImage: "search_history_delete", imageEdgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10), target: self, action: #selector(navDeleteButtonClick))
        
        let refresh = UIBarButtonItem(norImage: "search_keyword_refresh", selImage: "search_keyword_refresh", imageEdgeInsets: .zero, target: self, action: #selector(navRefreshButtonClick))
        
        navigationItem.rightBarButtonItems = [delete, refresh]
    }
    //MARK: - 删除
    @objc func navDeleteButtonClick() {
        print("navDeleteButtonClick")
    }
    //MARK: - 刷新
    @objc func navRefreshButtonClick() {
        print("navRefreshButtonClick")
    }
}

extension HSJCViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HSJCCollectionViewCell", for: indexPath) as? HSJCCollectionViewCell else { return HSJCCollectionViewCell() }
        cell.tagImageView.isHidden = indexPath.row % 2 == 0
        return cell
    }
}

extension HSJCViewController {
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: screenWidth, height: 153)
    }
}
