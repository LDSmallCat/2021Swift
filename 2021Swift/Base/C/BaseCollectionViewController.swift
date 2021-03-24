//
//  BaseCollectionViewController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/3/24.
//

import UIKit

class BaseCollectionViewController: BaseViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = CGFloat.leastNonzeroMagnitude
        layout.minimumInteritemSpacing = CGFloat.leastNonzeroMagnitude
        layout.itemSize = CGSize(width: screenWidth, height: 44)
        
        let cl = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cl.dataSource = self
        cl.delegate = self
        cl.backgroundColor = UIColor.background
        cl.alwaysBounceVertical = true
        cl.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: "BaseCollectionViewCell")
        cl.register(BaseCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "BaseCollectionReusableView")
        return cl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
       

}
//MARK: - 返回视图
extension BaseCollectionViewController: UICollectionViewDataSource{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        2
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCollectionViewCell", for: indexPath) as? BaseCollectionViewCell else { return BaseCollectionViewCell() }
        
        cell.backgroundColor = UIColor.random
        cell.testLabel.text = "section = \(indexPath.section)" + "  " + "row = \(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "BaseCollectionReusableView", for: indexPath)
    }
}
//MARK: - 视图高度
extension BaseCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: screenWidth, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       UIEdgeInsets.zero
    }
 
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 50;
//    }
//
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 100;
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize.zero
   }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize.zero
   }
}


//MARK: - cell点击事件
extension BaseCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lPrint(indexPath)
    }
}
