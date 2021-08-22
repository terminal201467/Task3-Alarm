//
//  WeekDayViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/21.
//

import UIKit

class WeekDayViewController: UIViewController {
    //MARK:-Properties
    let weekDaySelectView:WeekDaySelectView = .init()
    var weekDay:[Week] = [.Sun,.Mon,.Tue,.Wed,.Thu,.Fri,.Sat]
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weekDaySelectView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
//        setWeekDayArray()
//        weekDaySelectView.tableView.reloadData()
    }
    //MARK:-MethodForNavigationAction
    @objc func back(){
        let createAlarmVC = CreatAlarmViewController()
        self.navigationController?.pushViewController(createAlarmVC, animated: true)
    }
    //MARK:-setNavigationBar
    func setNavigationBar(){
        title = "重複"
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let backButton = UIBarButtonItem(title: "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(WeekDayViewController.back))
        backButton.tintColor = .orange
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    //MARK:-setTableViewDelegateAndDataSource
    func setTableView(){
        weekDaySelectView.tableView.delegate = self
        weekDaySelectView.tableView.dataSource = self
    }
//    func setWeekDayArray(){
//        weekDay.append(Week.Sun)
//        weekDay.append(Week.Mon)
//        weekDay.append(Week.Tue)
//        weekDay.append(Week.Wed)
//        weekDay.append(Week.Thu)
//        weekDay.append(Week.Fri)
//        weekDay.append(Week.Sat)
//        print("weekDay的內容:",weekDay)
//    }
}
extension WeekDayViewController:UITableViewDelegate,UITableViewDataSource{
    /*回傳有多少的cell**/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("1.weekDay的數量:",weekDay.count)
        return weekDay.count
    }
    /*回傳cell的內容**/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //有一個重點是weekDay裡面的東西沒有進來
        print("2.weekDay的內容",weekDay)
        let weekDayCell = weekDay[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    /*回傳點選cell的結果**/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let weekDaySelect = weekDay[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        if indexPath.row != nil{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
}



