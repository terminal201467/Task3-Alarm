//
//  AlarmViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/3.
//

import UIKit

class AlarmViewController: UIViewController {
    //MARK:-Properties
    let alarmView:AlarmView = .init()
    let sections:[Section] = [.sleep,.other]
    let TimeCell:[ClockCoice] = [ClockCoice]()
    //靜態字串
    var sleepTime:[Clock] = [Clock]()
    var addAlarm:[Clock] = [Clock]()
    //儲存時間的字串
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = alarmView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setAlarmNavigationBar()
        setAlarmTableViewDelegateAndDataSource()
    }
    
    //MARK:-Methods for create alarm
    @objc func createAlarm(){
        let createAlarmVC = CreatAlarmViewController()
        createAlarmVC.modalPresentationStyle = .formSheet
        //重新開一個rootViewController
        let nav = UINavigationController(rootViewController: createAlarmVC)
        createAlarmVC.modalTransitionStyle = .coverVertical
        present(nav, animated: true)
    }
    @objc func editAlarm(){
        alarmView.alarmTableView.isEditing = true
    }
    //MARK:-alarmTableView Delegate and Datasource
    func setAlarmTableViewDelegateAndDataSource(){
        alarmView.alarmTableView.delegate = self
        alarmView.alarmTableView.dataSource = self
    }
    
    //MARK:-setupNavigation
    func setAlarmNavigationBar(){
        title = "鬧鐘"
        view.backgroundColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true //是否為半透明
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]//字體改為白色
    
        let createButton = UIBarButtonItem(barButtonSystemItem: .add,
                                           target: self,
                                           action: #selector(AlarmViewController.createAlarm))

        navigationItem.rightBarButtonItem = createButton
        //改動顏色
        editButtonItem.tintColor = UIColor.orange
        createButton.tintColor = UIColor.orange
        /*使用原生的editButton**/
        navigationItem.leftBarButtonItem = editButtonItem
    }

}

//MARK:-ExtensionOnTableView
extension AlarmViewController:UITableViewDelegate,UITableViewDataSource{
    /*回傳多少cell**/
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    /*計算每一個section有幾個cell*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionCase = sections[section]
        switch sectionCase {
        case .sleep:
            return sleepTime.count
        case .other:
            return addAlarm.count
        }
    }
    /*設定tableView裡面的sectionTitle**/
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = sections[section]
        switch title {
        case .sleep:
            return "睡眠｜起床鬧鐘"
        case .other:
            return "其他"
        }
    }
    
    /*回傳Cell的內容**/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timeCell = TimeCell[indexPath.section]
        switch timeCell{
        case .getUPAlarmCell:
            let sleepCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let sleepCellButton = UIButton()
            sleepCell.accessoryView = sleepCellButton
            return sleepCell
        case .ClockCell:
            let otherCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let otherCellSwitch = UISwitch()
            otherCell.accessoryView = otherCellSwitch
            return otherCell
        }
    }
    
    /*可以點按修改模式**/
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    /*點按可修改之後開啟刪除、修改模式**/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .none{
            print("edit something")
        }
    }
    /*點按編輯後，才會動作**/
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        return
    }

}
