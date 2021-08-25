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
    var sleepTime:[Clock] = [Clock]()
    
    var testArrayA = ["A","B","C"]
    var testArrayB:[String] = ["a","b","c"]
    var testArrayC:[String] = ["1","2","3"]
    
    //新增鬧鐘的陣列，裡面記錄鬧鐘的內容
    var clock:Clock?
    var addAlarm:[Clock] = [Clock](){
        didSet{
            saveData()
        }
    }
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = alarmView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAlarmNavigationBar()
        setAlarmTableViewDelegateAndDataSource()
        setDataPass()
    }
    //MARK:-MethodsForCreateAlarmVC
    @objc func createAlarm(){
        let createAlarmVC = CreatAlarmViewController()
        createAlarmVC.modalPresentationStyle = .formSheet
        //重新開一個rootViewController
        let nav = UINavigationController(rootViewController: createAlarmVC)
        createAlarmVC.modalTransitionStyle = .coverVertical
        present(nav, animated: true)
    }
    //MARK:-setDataPassFromOtherController
    func setDataPass(){
        let weekSelectVC = WeekDaySelectViewController()
        weekSelectVC.weekSelectDelegate = self
        let editAlarmVC = EditAlarmNameViewController()
        editAlarmVC.editNameDelegate = self
        let creatAlarmVC = CreatAlarmViewController()
        creatAlarmVC.createVCForClockDelegate = self
    }
    //MARK:-alarmTableViewDelegateAndDatasource
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
        createButton.tintColor = UIColor.orange
        //editingButton
        editButtonItem.tintColor = UIColor.orange
        navigationItem.leftBarButtonItem = editButtonItem
        }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(isEditing, animated: true)
        if alarmView.alarmTableView.isEditing{
            self.navigationItem.leftBarButtonItem?.title = "完成"
            alarmView.alarmTableView.allowsSelectionDuringEditing = true
        }else{
            self.navigationItem.leftBarButtonItem?.title = "編輯"
            alarmView.alarmTableView.allowsSelectionDuringEditing = false
        }
    }
    //MARK:-setUserDefault
    func saveData(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(addAlarm), forKey: "Time")
    }
    func ReadData(){
        if let data = UserDefaults.standard.value(forKey: "Time") as? Data{
            if let addAlarmRead = try? PropertyListDecoder().decode(Array<Clock>.self, from:data){
                addAlarm = addAlarmRead
                print("1.儲存:",addAlarm)
            }
        }
    }
}

//MARK:-ExtensionOnTableView
extension AlarmViewController:UITableViewDelegate,UITableViewDataSource,CreateAlarmViewForClockDelegate,WeekDaySelectViewDelegate,EditAlarmNameViewDelegate{
    //MARK:-ProtocolOfTableView
    /*回傳多少cell**/
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
    /*計算每一個section有幾個cell*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArrayA.count
    }
    /*設定tableView裡面的sectionTitle**/
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return testArrayA[indexPath]? "睡眠｜起床鬧鐘":"其他"
//        }
            
//        let arrayA = testArrayA[indexPath.]
//        switch title {
//        case .sleep:
//            return "睡眠｜起床鬧鐘"
//        case .other:
//            return "其他"
//        }
//    }
    /*回傳Cell的內容**/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let testArray = testArrayA[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) //as! AlarmTableViewCell
        cell.textLabel?.text = testArray
//        cell.clockLabel.text = clock?.appearTime()
//        cell.ampmLabel.text = clock?.appearTimeAMPM()
//        cell.detailLabel.text = clock?.appearString
        return cell

//        let timeCell = TimeCell[indexPath.section]
//        switch timeCell{
//        case .getUPAlarmCell:
//            let sleepCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//            let sleepCellButton = UIButton()
//            sleepCell.accessoryView = sleepCellButton
//            return sleepCell
//        case .ClockCell:
//            let ClockCell = addAlarm[indexPath.row]
//            var otherCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AlarmTableViewCell
//            let otherCellSwitch = UISwitch()
//            otherCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell") as! AlarmTableViewCell
//            otherCell.accessoryView = otherCellSwitch
//            otherCell.ampmLabel.text = addAlarm[indexPath.row].appearTimeAMPM()
//            otherCell.clockLabel.text = addAlarm[indexPath.row].appearTime()
//            otherCell.detailTextLabel?.text = addAlarm[indexPath.row].name + addAlarm[indexPath.row].repeatDay
//            return otherCell
//
//            print("2.時間列:",addAlarm[indexPath.row].appearTime())
//        }
    }
    /*可以點按修改模式**/
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    /*點按可修改之後開啟刪除、修改模式**/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let array = testArrayA[indexPath.row]
        if editingStyle == .delete{
            testArrayA.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .none{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.accessoryType = .disclosureIndicator
        }
    }
    /*點按編輯後，才會動作**/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK:-ProtocolForDataPass
    //回傳選取鬧鐘週次
    func receiveWeekSelectData(data: Set<Week>) {
        clock?.pickDay = data
        print(data)
        print(clock?.pickDay)
    }
    //傳送鬧鐘名稱
    func receiveEditNameData(data: String) {
        print(data)
        clock?.name = data
        print(clock?.name)
    }
    func receiveCreateAlarmViewForClock(data: Date) {
        print(data)
        clock?.date = data
        print(clock?.date)
    }
}
