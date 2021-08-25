//
//  CreatAlarmView.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/4.
//

import UIKit

class CreatAlarmView: UIView {
    //MARK:-Properties
    let theLabel:UILabel = {
        let theLabel = UILabel()
        theLabel.text = "時間"
        theLabel.textColor = .white
        theLabel.backgroundColor = .black
        theLabel.font = UIFont(name: "Helvetica", size: 20)
        theLabel.textAlignment = .left
        theLabel.numberOfLines = 1
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        return theLabel
    }()
    let createTimePicker:UIDatePicker = {
        let createTimePicker = UIDatePicker()
        createTimePicker.datePickerMode = .time
        createTimePicker.preferredDatePickerStyle = .inline
        createTimePicker.tintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        createTimePicker.setValue(UIColor.white, forKey: "textColor")
        createTimePicker.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        createTimePicker.overrideUserInterfaceStyle = .dark
        createTimePicker.date = NSDate() as Date
        return createTimePicker
    }()
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.tintColor = .darkText
        //註冊第一種cell(一般可以走到細節頁面的cell)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier:"settingCell")
        tableView.register(UITableViewCell.self,forCellReuseIdentifier:"ringingCell")
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.allowsSelectionDuringEditing = true
        tableView.isEditing = false
        tableView.backgroundColor = UIColor.black
        
        let footerView = UIView()
        footerView.backgroundColor = .black
        footerView.frame.size.height = 100
        tableView.tableFooterView = footerView
        return tableView
    }()
    //MARK:-StackView
    lazy var upperStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [theLabel,createTimePicker])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var middleStackView:UIStackView = {
        let middleStackView = UIStackView(arrangedSubviews: [tableView])
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        return middleStackView
    }()
    //MARK:-override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(theLabel)
        addSubview(createTimePicker)
        addSubview(tableView)
        addSubview(middleStackView)
        addSubview(upperStackView)
        autoLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:setAutoLayout
    func autoLayout(){
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        upperStackView.topAnchor.constraint(equalTo: topAnchor,constant: 30).isActive = true //和上面的距離
        upperStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        upperStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        upperStackView.bottomAnchor.constraint(equalTo:bottomAnchor,constant: -550).isActive = true
        
        middleStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor).isActive = true
        middleStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        middleStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        middleStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

