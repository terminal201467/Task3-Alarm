//
//  WeekDayViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/21.
//

import UIKit

class WeekDaySelectViewController: UIViewController {
    //MARK:-Properties
    let weekDaySelectView:WeekDaySelectView = .init()
    var weekDay:[Week] = [.Sun,.Mon,.Tue,.Wed,.Thu,.Fri,.Sat]
    var chooseDay = Set<Week>()
    weak var weekSelectDelegate:WeekDaySelectViewDelegate!
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weekDaySelectView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
    }
    //在畫面結束之前把值傳出去
    override func viewWillDisappear(_ animated: Bool){
        //如果chooseDay跟repeatingDay的內容相同的話，就返回
        weekSelectDelegate?.receiveWeekSelectData(data: chooseDay)
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
        let backButton = UIBarButtonItem(title: "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(WeekDaySelectViewController.back))
        backButton.tintColor = .orange
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    //MARK:-setTableViewDelegateAndDataSource
    func setTableView(){
        weekDaySelectView.tableView.delegate = self
        weekDaySelectView.tableView.dataSource = self
    }
}
extension WeekDaySelectViewController:UITableViewDelegate,UITableViewDataSource{
    /*回傳有多少的cell**/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekDay.count
    }
    /*回傳cell的內容**/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weekDayCell = weekDay[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = weekDayCell.text
        cell.tintColor = .orange
        let chooseDayContained = chooseDay.contains(weekDayCell)
        cell.accessoryType = chooseDayContained ? .checkmark:.none
        return cell
    }
    /*回傳點選cell的結果**/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let weekDayCell = weekDay[indexPath.row]
        let chooseDayContained = chooseDay.contains(weekDayCell)
        if chooseDayContained{
            chooseDay.remove(weekDayCell)
        }else{
            chooseDay.insert(weekDayCell)
        }
        tableView.reloadData()
    }
}





