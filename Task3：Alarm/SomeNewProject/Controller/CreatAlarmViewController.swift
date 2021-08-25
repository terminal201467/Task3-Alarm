//
//  CreatAlarmViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/4.
//

import UIKit

class CreatAlarmViewController: UIViewController{
    //MARK:-Properties
    let createAlarmView:CreatAlarmView = .init()
    var choosenTime = String()
    //時鐘的新增資料
    var clockTime:[String] = [String](){
        didSet{
            saveData()
        }
    }
    //上午下午
    var ampmTime:[String] = [String]()
    var clock:Clock?
    var cellTitle:[CellTitle] = [CellTitle]()
    let settingCell:[SettingCellTitle] = [SettingCellTitle]()
    let ringingCell:[RingCellTitle] = [RingCellTitle]()
    
    //delegateForClock
    weak var createVCForClockDelegate:CreateAlarmViewForClockDelegate!

    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = createAlarmView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarInCreateAlarmVC()
        setTableViewDelegateAndDataSource()
//        setTimePicker()
        tableViewCustomArray()
        setDataPassDelegate()
        setClockValue()
        selectTime()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createAlarmView.createTimePicker.becomeFirstResponder()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        createVCForAMPMDelegate?.receiveCreateAlarmViewForAMPM(data: <#T##String#>)
    }
    //MARK:-MethodsInNavigationBar
    @objc func cancel(){
        dismiss(animated: true, completion: nil)
    }
    @objc func save(){
        //clockTime.append(choosenTime)
        selectTime()
        dismiss(animated: true, completion: nil)
    }
    func selectTime(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_Hant_TW")
        formatter.timeZone = TimeZone(identifier: "Asia/Taipei")
        createVCForClockDelegate?.receiveCreateAlarmViewForClock(data: createAlarmView.createTimePicker.date)
    }
//    @objc func setTime(){
//        let fomatter = DateFormatter()
//        fomatter.locale = Locale(identifier: "zh_TW")
//        fomatter.amSymbol = "AM"
//        fomatter.pmSymbol = "PM"
//        fomatter.dateFormat = "HH:mm"
//
//        let fromDateTime = fomatter.date(from: "00:00")
//        let EndDateTime = fomatter.date(from: "11:59")
//        createAlarmView.createTimePicker.minimumDate = fromDateTime
//        createAlarmView.createTimePicker.maximumDate = EndDateTime
//        choosenTime = fomatter.string(from: createAlarmView.createTimePicker.date)
//        print(choosenTime)
//    }
//    //MARK:-setTimePicker
//    func setTimePicker(){
//        createAlarmView.createTimePicker.addTarget(self,
//                                                   action: #selector(CreatAlarmViewController.setTime), for: .valueChanged)
//    }
    //MARK:-setTableViewDelegateAndDatasource
    func setTableViewDelegateAndDataSource(){
        createAlarmView.tableView.delegate = self
        createAlarmView.tableView.dataSource = self
    }
    //MARK:-setDataPassDelegate
    func setDataPassDelegate(){
        let weekSelectVC = WeekDaySelectViewController()
        weekSelectVC.weekSelectDelegate = self
        let editAlarmVC =  EditAlarmNameViewController()
        editAlarmVC.editNameDelegate = self
    }
    func setClockValue(){
        //用這裡來控制clock的狀態
        if clock != nil{
            clock?.modeSelect = .edit
        }else{
            //如果有值的話
            clock = Clock(name: "鬧鐘", date: Date(), pickDay: [], isOn: true, modeSelect: .create)
        }
    }
    //MARK:-TableViewCustom
    func tableViewCustomArray(){
        cellTitle.append(CellTitle.SettingCellTitle(model: SettingCellTitle.repeatDay))
        cellTitle.append(CellTitle.SettingCellTitle(model: SettingCellTitle.label))
        cellTitle.append(CellTitle.SettingCellTitle(model: SettingCellTitle.ringing))
        cellTitle.append(CellTitle.RingCellTitle(model: RingCellTitle.remindLater))
    }
    //MARK:-setUserDefault
    let userDefault = UserDefaults()
    func saveData(){
        UserDefaults.standard.set(clockTime, forKey: "Time")
    }
    func readData(){
        clockTime = UserDefaults.standard.stringArray(forKey: "Time") ?? []
    }
    //MARK:-setNavigationBarInCAV
    func navigationBarInCreateAlarmVC(){
        view.backgroundColor = UIColor.black
        title = "加入鬧鐘"
        navigationItem.backButtonTitle = "返回"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]//字體改為白色
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain,target: self,action:#selector(CreatAlarmViewController.cancel))
        let saveButton = UIBarButtonItem(title: "儲存",style: .plain,target: self,action:#selector(CreatAlarmViewController.save))
        cancelButton.tintColor = UIColor.orange
        saveButton.tintColor = UIColor.orange
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = cancelButton
    }
}
extension CreatAlarmViewController: UITableViewDelegate, UITableViewDataSource,EditAlarmNameViewDelegate,WeekDaySelectViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellTitle[indexPath.row]
        switch cell.self {
        case .SettingCellTitle(let settingCellTitle):
            var settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
            settingCell = UITableViewCell(style: .value1, reuseIdentifier: "settingCell")
            settingCell.textLabel?.text = settingCellTitle.item
            settingCell.accessoryType = .disclosureIndicator
            settingCell.detailTextLabel?.textColor = .white
            if indexPath.section == 0{
                if indexPath.row == 0{
                    settingCell.detailTextLabel?.text = clock?.repeatDay
                }else if indexPath.row == 1{
                    settingCell.detailTextLabel?.text = clock?.name
                }else if indexPath.row == 2{
                    settingCell.detailTextLabel?.text = "無"
                }
            }
            return settingCell
        case .RingCellTitle(let ringingCellTitle):
            let ringingCell = tableView.dequeueReusableCell(withIdentifier: "ringingCell", for: indexPath)
            let switchIcon = UISwitch()
            ringingCell.textLabel?.text = ringingCellTitle.item
            switchIcon.isOn = true
            ringingCell.accessoryView = switchIcon
            return ringingCell
        }
    }
    /*點選之後**/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0{
            if indexPath.row == 0{
                let weekDayVC = WeekDaySelectViewController()
                weekDayVC.weekSelectDelegate = self
                self.navigationController?.pushViewController(weekDayVC, animated: true)
            }else if indexPath.row == 1{
                let editAlarmNameVC = EditAlarmNameViewController()
                editAlarmNameVC.editNameDelegate = self
                self.navigationController?.pushViewController(editAlarmNameVC, animated: true)
            }else if indexPath.row == 2{
                print("Not complete!")
            }
        }
    }
    func receiveEditNameData(data: String) {
        clock?.name = data
        createAlarmView.tableView.reloadData()
    }
    func receiveWeekSelectData(data: Set<Week>) {
        clock?.pickDay = data
        createAlarmView.tableView.reloadData()
    }
}

