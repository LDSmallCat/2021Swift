//
//  HomeViewController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class HomeViewController: BaseViewController {
    
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
        cl.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        cl.register(HomeCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionReusableView")
        cl.register(HomeSectionOneCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeSectionOneCollectionReusableView")
        
        cl.register(BaseCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "BaseCollectionReusableView")
        return cl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    
    override func configUI() {
        
        view.addSubview(collectionView)
    }
    
    override func configLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        User.logOut()
//    }
}

extension HomeViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 0 : testArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.titleLabel.text = testArray[indexPath.row]
        cell.backgroundColor = UIColor.backWhiteColor
        cell.line.isHidden = indexPath.row == testArray.count - 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section == 0 {
                let banner = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionReusableView", for: indexPath) as! HomeCollectionReusableView
                banner.navgationController = self.navigationController
                return banner
            }else{
                
                return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeSectionOneCollectionReusableView", for: indexPath)
            }
            
        }else{
            
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "BaseCollectionReusableView", for: indexPath)
        }
        
    }
}
extension HomeViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: screenWidth, height: 110)
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
        if section == 0 {
            return CGSize(width: screenWidth, height: 282);
        }
        
        if section == 1 {
            return CGSize(width: screenWidth, height: 44);
        }
        return CGSize.zero
        
    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: CGFloat.leastNonzeroMagnitude);
    }
}

extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        User.logOut()


    }
    
}
