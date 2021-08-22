//
//  EditAlarmNameViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/16.
//

import UIKit

class EditAlarmNameViewController: UIViewController {
    //MARK:-Properties
    let editAlarmNameView:EditAlarmNameView = .init()
    var name:[String] = [String]()
    
    //MARK:-Method
    @objc func backToCreateAlarmCV(){
        let createAlarm  = CreatAlarmViewController()
        let navCreateAlarm = UINavigationController(rootViewController: createAlarm)
        self.navigationController?.pushViewController(createAlarm, animated: true)
    }
    override func loadView() {
        super.loadView()
        view = editAlarmNameView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
//        setTableView()

        // Do any additional setup after loading the view.
    }
    //MARK:-setNavigation
    private func setNavigationBar(){
        title = "標籤"
        view.backgroundColor = .black
        let backButton = UIBarButtonItem(title: "返回",
                                         style: .plain,
                                         target: self,
                                         action: #selector(EditAlarmNameViewController.backToCreateAlarmCV))
        backButton.tintColor = .orange
        navigationItem.leftBarButtonItem = backButton
    }
    //MARK:setTableViewDelegateAndDatasource
//    private func setTableView(){
//        editAlarmNameView.tableView.delegate = self
//        editAlarmNameView.tableView.dataSource = self
//    }
    
}




