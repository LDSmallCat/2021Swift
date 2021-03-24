//
//  HSJCCollectionViewCell.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/3/24.
//

import UIKit

class HSJCCollectionViewCell: BaseCollectionViewCell {
    ///右侧远程标识
    lazy var tagImageView: UIImageView = {
        let s = UIImageView()
        s.image = UIImage(named: "tag_shenqing_right")
        return s
    }()
    ///姓名
    lazy var nameLabel: UILabel = {
        let n = UILabel()
        n.font = UIFont.systemFont(ofSize: 16)
        n.textColor = UIColor.hex(hexString: "222222")
        n.text = "王东升"
        return n
    }()
    ///状态背景
    lazy var statusImageView: UIImageView = {
        let s = UIImageView()
        s.image = UIImage(named: "tag_shenqing_blue")
        return s
    }()
    ///状态文字
    lazy var statusLabel: UILabel = {
        let n = UILabel()
        n.font = UIFont.systemFont(ofSize: 12)
        n.textColor = UIColor.hex(hexString: "FFFFFF")
        n.textAlignment = .center
        n.text = "暂存"
        return n
    }()
    ///申请编号
    lazy var numberLabel: UILabel = {
        let n = UILabel()
        n.font = UIFont.systemFont(ofSize: 14)
        n.textColor = UIColor.hex(hexString: "999999")
        n.text = "申请编号：1189765"
        return n
    }()
    
    ///客户电话
    lazy var phoneLabel: UILabel = {
        let n = UILabel()
        n.font = UIFont.systemFont(ofSize: 14)
        n.textColor = UIColor.hex(hexString: "999999")
        n.text = "客户电话：13156765876"
        return n
    }()
    ///电话按钮
    lazy var phoneButton: UIButton = {
        let n = UIButton(type: .custom)
        n.addTarget(self, action: #selector(phoneButtonClick), for: .touchUpInside)
        n.setBackgroundImage(UIImage(named: "icon_appsheet_list_dial"), for: .normal)
        return n
    }()
    
    ///更多按钮
    lazy var moreButton: UIButton = {
        let n = UIButton(type: .custom)
        n.addTarget(self, action: #selector(moreButtonClick), for: .touchUpInside)
        n.setImage(UIImage(named: "btn_list_more"), for: .normal)
        return n
    }()
    
    ///授权状态
    lazy var statusButton: UIButton = {
        let n = UIButton(type: .custom)
        n.addTarget(self, action: #selector(statusButtonClick(_:)), for: .touchUpInside)
        n.setTitle("授权状态", for: .normal)
        n.setImage(UIImage(named: "icon_shenqing_down"), for: .normal)
        n.setImage(UIImage(named: "icon_shenqing_up"), for: .selected)
        n.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -110)
        n.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        configBorder(button: n)
        return n
    }()
    
    ///日志
    lazy var logButton: UIButton = {
        let n = UIButton(type: .custom)
        n.addTarget(self, action: #selector(logButtonClick), for: .touchUpInside)
        n.setTitle("日志", for: .normal)
        configBorder(button: n)
        return n
    }()
    
    ///编辑
    lazy var editeButton: UIButton = {
        let n = UIButton(type: .custom)
        n.addTarget(self, action: #selector(editeButtonClick), for: .touchUpInside)
        n.setTitle("编辑", for: .normal)
        configBorder(button: n)
        return n
    }()
    
    func configBorder(button: UIButton) {
        button.setTitleColor(UIColor.hex(hexString: "555555"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.hex(hexString: "CCCCCC").cgColor
    }
    override func configUI() {
        backView.backgroundColor = UIColor.hex(hexString: "FFFFFF")
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        addSubview(backView)
        
        backView.addSubview(tagImageView)
        backView.addSubview(nameLabel)
        backView.addSubview(statusImageView)
        statusImageView.addSubview(statusLabel)
        backView.addSubview(numberLabel)
        backView.addSubview(phoneLabel)
        backView.addSubview(line)
        backView.addSubview(phoneButton)
        backView.addSubview(moreButton)
        backView.addSubview(statusButton)
        backView.addSubview(logButton)
        backView.addSubview(editeButton)
    }
    
    override func configLayout() {
        backView.snp.makeConstraints{
            $0.top.left.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview().offset(-10)
        }
        
        tagImageView.snp.makeConstraints{
            $0.top.right.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.left.equalToSuperview().offset(15)
            $0.height.equalTo(23)
        }
        
        statusImageView.snp.makeConstraints{
            $0.left.equalTo(nameLabel.snp.right).offset(5)
            $0.centerY.equalTo(nameLabel)
            $0.right.lessThanOrEqualTo(tagImageView.snp.left).offset(-7)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        statusLabel.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        phoneButton.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-35)
            $0.width.height.equalTo(30)
            $0.top.equalToSuperview().offset(35)
        }
        
        numberLabel.snp.makeConstraints{
            $0.left.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.height.equalTo(18)
        }
        
        phoneLabel.snp.makeConstraints{
            $0.left.equalTo(nameLabel)
            $0.top.equalTo(numberLabel.snp.bottom).offset(3)
            $0.height.equalTo(18)
        }
        
        line.isHidden = false
        line.snp.makeConstraints{
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(0.5)
            $0.top.equalTo(phoneLabel.snp.bottom).offset(10)
        }
        
        moreButton.snp.makeConstraints{
            $0.left.equalTo(nameLabel)
            $0.width.equalTo(20)
            $0.height.equalTo(5)
            $0.top.equalTo(line.snp.bottom).offset(20)
        }
        
        editeButton.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-10)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
            $0.centerY.equalTo(moreButton)
        }
        
        logButton.snp.makeConstraints{
            $0.right.equalTo(editeButton.snp.left).offset(-10)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
            $0.centerY.equalTo(moreButton)
        }

        statusButton.snp.makeConstraints{
            $0.right.equalTo(logButton.snp.left).offset(-10)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
            $0.centerY.equalTo(moreButton)
        }
    }
}
//MARK: - 交互事件
extension HSJCCollectionViewCell {
    @objc func phoneButtonClick() {
        lPrint(phoneButtonClick)
    }
    @objc func moreButtonClick() {
        lPrint(moreButtonClick)
    }
    @objc func logButtonClick() {
        lPrint(logButtonClick)
    }
    @objc func editeButtonClick() {
        lPrint("editeButtonClick")
    }
    @objc func statusButtonClick(_ statusButton: UIButton) {
        statusButton.isSelected = !statusButton.isSelected
        
    }
    
}
