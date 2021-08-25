//
//  AlarmView.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/4.
//

import UIKit

class AlarmView: UIView {
    //MARK:-Properties
    let alarmTableView:UITableView = {
        let alarmTable = UITableView()
        alarmTable.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alarmTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        alarmTable.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        alarmTable.separatorStyle = .singleLine
        alarmTable.allowsSelection = true
        alarmTable.allowsSelectionDuringEditing = true
//        alarmTable.isEditing = true
        alarmTable.allowsMultipleSelection = true
        alarmTable.translatesAutoresizingMaskIntoConstraints = false
        return alarmTable
    }()
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [alarmTableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    //MARK:-setFrame
    override init(frame:CGRect){
        super.init(frame:frame)
        addSubview(alarmTableView)
        addSubview(stackView)
        autoLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("NaNa")
    }
    func autoLayout(){
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
