//
//  WeekDaySelectController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/17.
//
import UIKit
class WeekDaySelectView: UIView {
    //MARK:-Properties
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.tintColor = .darkText
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.allowsSelectionDuringEditing = true
        tableView.isEditing = false
        tableView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let footerView = UIView()
        footerView.backgroundColor = .black
        footerView.frame.size.height = 300
        tableView.tableFooterView = footerView
        return tableView
    }()
    //MARK:-StackView
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tableView])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    //MARK:-setFrame
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(tableView)
        addSubview(stackView)
        autoLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:-AutoLayout
    func autoLayout(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor ,constant:100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor ,constant:-300).isActive = true
    }
}
