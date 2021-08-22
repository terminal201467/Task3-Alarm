////
////  TableViewCell.swift
////  SomeNewProject
////
////  Created by Jhen Mu on 2021/8/14.
////
//
//import UIKit
//
//class SettingTableViewCell: UITableViewCell {
//
//    static let identifier = "settingTableViewCell"
//    
//    private let theLabelViewInCell:UILabel = {
//        let theLabelViewInCell = UILabel()
//        theLabelViewInCell.numberOfLines = 1
//        return theLabelViewInCell
//    }()
//    
////    private let theDetailLabelInCell:UILabel = {
////        let theDetailLabelInCell = UILabel()
////        theDetailLabelInCell.numberOfLines = 1
////        return theDetailLabelInCell
////    }()
//    
//    //MARK:-SetCellStyle
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(theLabelViewInCell)
//        accessoryType = .disclosureIndicator
//    }
//    //MARK:-SetCellLayout
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        theLabelViewInCell.frame = CGRect(x: 15,y: 0,
//                                          width: contentView.frame.size.width,
//                                          height: contentView.frame.size.height)
//        
//        imageView
////        theDetailLabelInCell.frame = CGRect(x: 30,
////                                            y: 0,
////                                            width: contentView.frame.size.width,
////                                            height: contentView.frame.size.height)
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        theLabelViewInCell.text = nil
////        theDetailLabelInCell.text = nil
//    }
//    
//    public func configuration(with model:getUpAlarm){
//        theLabelViewInCell.text = model.title
//        theLabelViewInCell.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
////        theDetailLabelInCell.text = model.detailForlabel
////        theDetailLabelInCell.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//}
