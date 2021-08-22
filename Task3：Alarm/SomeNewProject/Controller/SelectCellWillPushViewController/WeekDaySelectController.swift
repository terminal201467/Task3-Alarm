//
//  WeekDaySelectController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/16.
//

import UIKit

class WeekDaySelectController: UIViewController{
    //MARK:-Properties
    let weekDaySelectView:WeekDaySelectView = .init()
    var weekDay:[Week] = Week.allCases
    var isPickDay = Set<Week>()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weekDaySelectView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarForWeekSelect()
        setTableView()
    }
    //MARK:-Method in
    @objc func backToCreateAlarmViewController(){
        let createAlarmVC = CreatAlarmViewController()
        let navInCreatAlarmVC = UINavigationController(rootViewController: createAlarmVC)
        self.navigationController?.pushViewController(createAlarmVC, animated: true)
    }
    //MARK:- setNavigationBar
    func setNavigationBarForWeekSelect(){
        view.backgroundColor = .black
        title = "重複"
        let backButton = UIBarButtonItem(title: "返回",
                                         style: .plain,
                                         target: self,
                                         action: #selector(WeekDaySelectController.backToCreateAlarmViewController))
        backButton.tintColor = UIColor.orange
        navigationItem.leftBarButtonItem = backButton
    }
    //MARK:-setTableViewDelegate
    func setTableView(){
        weekDaySelectView.tableViewInWeekDaySelect.delegate = self
        weekDaySelectView.tableViewInWeekDaySelect.dataSource = self
    }
}
extension WeekDaySelectController:UITableViewDelegate,UITableViewDataSource{
    /*回傳有內容的cell的數量**/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekDay.count
    }
    /*回傳cell的內容**/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weekDay = weekDay[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pickDayContain = isPickDay.contains(weekDay)
        cell.accessoryType = pickDayContain ? .checkmark:.none
        switch weekDay.self {
        case .Sun:
            cell.textLabel?.text = Week.Sun.text
            return cell
        case .Mon:
            cell.textLabel?.text = Week.Mon.text
            return cell
        case .Tue:
            cell.textLabel?.text = Week.Tue.text
            return cell
        case .Wed:
            cell.textLabel?.text = Week.Wed.text
            return cell
        case .Thu:
            cell.textLabel?.text = Week.Thu.text
            return cell
        case .Fri:
            cell.textLabel?.text = Week.Fri.text
            return cell
        case .Sat:
            cell.textLabel?.text = Week.Sat.text
            return cell
        }
    }
    /*點選的項目**/
    //這邊到時候還會加一個動作是點選，然後傳值回去
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDay = weekDay[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        let pickDayContain = isPickDay.contains(selectedDay)
        if pickDayContain{
            isPickDay.remove(selectedDay)
        }else{
            isPickDay.insert(selectedDay)
        }
        tableView.reloadData()
    }
}


