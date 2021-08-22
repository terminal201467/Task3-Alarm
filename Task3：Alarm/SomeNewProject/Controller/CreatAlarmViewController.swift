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
    var alarmTime:[String] = [String](){
        didSet{
            saveData()
        }
    }
    var getLabel:String! = "鬧鐘"
    var cellTitle:[CellTitle] = [CellTitle]()
    let settingCell:[SettingCellTitle] = [SettingCellTitle]()
    let ringingCell:[RingCellTitle] = [RingCellTitle]()
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = createAlarmView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarInCreateAlarmVC()
        setTableViewDelegateAndDataSource()
        setTimePicker()
        tableViewCustomArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    //MARK:-MethodsInNavigationBar
    @objc func cancel(){
        dismiss(animated: true, completion: nil)
    }
    @objc func save(){
        alarmTime.append(choosenTime)
        dismiss(animated: true, completion: nil)
    }
    @objc func setTime(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_TW")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "HH:mm a"
        //設置可選日期區間
        let fromDateTime = formatter.date(from: "00:00")
        let EndDateTime = formatter.date(from: "11:59")
        createAlarmView.createTimePicker.minimumDate = fromDateTime
        createAlarmView.createTimePicker.maximumDate = EndDateTime
        choosenTime = formatter.string(from: createAlarmView.createTimePicker.date)
    }
    //MARK:-setTimePicker
    func setTimePicker(){
        createAlarmView.createTimePicker.addTarget(self,
                                                   action: #selector(CreatAlarmViewController.setTime), for: .valueChanged)
    }
    //MARK:-setTableViewDelegateAndDatasource
    func setTableViewDelegateAndDataSource(){
        createAlarmView.tableView.delegate = self
        createAlarmView.tableView.dataSource = self
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
        UserDefaults.standard.set(alarmTime, forKey: "Time")
    }
    func readData(){
        alarmTime = UserDefaults.standard.stringArray(forKey: "Time") ?? []
    }
    //MARK:-setNavigationBarInCAV
    func navigationBarInCreateAlarmVC(){
        view.backgroundColor = UIColor.black
        title = "加入鬧鐘"
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
extension CreatAlarmViewController: UITableViewDelegate, UITableViewDataSource,LabelDataPass{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellTitle[indexPath.row] //決定要有幾行
        switch cell.self {
        case .SettingCellTitle(let settingCellTitle):
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
            settingCell.textLabel?.text = settingCellTitle.item
            settingCell.accessoryType = .disclosureIndicator
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
                let weekDayVC = WeekDayViewController()
                self.navigationController?.pushViewController(weekDayVC, animated: true)
            }else if indexPath.row == 1{
                let editAlarmNameVC = EditAlarmNameViewController()
                self.navigationController?.pushViewController(editAlarmNameVC, animated: true)
            }else if indexPath.row == 2{
                print("Not complete!")
            }
        }
    }
    
    func receiveLabelData(data: String) {
        getLabel = data
    }
}

