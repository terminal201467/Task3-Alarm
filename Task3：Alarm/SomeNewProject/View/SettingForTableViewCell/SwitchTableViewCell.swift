//
//  SwitchTableViewCell.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/15.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    static let identifier = "switchTableView"
    
    private var theSwitchInCell:UISwitch = {
        let theSwitchInCell = UISwitch()
        theSwitchInCell.onTintColor = .systemGreen
        return theSwitchInCell
    }()
    
    private var theLabelInCell:UILabel = {
        let theLabelInCell = UILabel()
        theLabelInCell.numberOfLines = 1
        return theLabelInCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //在內容裡面加上theSwitchInCell
        contentView.addSubview(theLabelInCell)
        contentView.addSubview(theSwitchInCell)
    }
    
    //排列cell裡面的版面
    override func layoutSubviews() {
        theSwitchInCell.sizeToFit()
        theSwitchInCell.frame = CGRect(x:(contentView.frame.size.width - theSwitchInCell.frame.size.width - 20),
                                       y:(contentView.frame.size.height - theSwitchInCell.frame.size.height)/2,
                                       width: theSwitchInCell.frame.size.width,
                                       height: theSwitchInCell.frame.size.height)
        theLabelInCell.sizeToFit()
        theLabelInCell.frame = CGRect(x: 15, y: 0,
                                      width: contentView.frame.size.width,
                                      height: contentView.frame.size.height)
    }
    override func prepareForReuse() {
        theSwitchInCell.isOn = false
        
    }
    
    public func configuration(with model: CellForSwitchOption) {
        theLabelInCell.text = model.title
        theLabelInCell.textColor = .white
        theSwitchInCell.isOn = model.isOn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
