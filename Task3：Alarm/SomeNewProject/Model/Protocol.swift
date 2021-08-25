//
//  Protocol.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/20.
//

import Foundation

//傳輸標籤用
protocol EditAlarmNameViewDelegate:AnyObject {
    func receiveEditNameData(data:String)
}

//傳輸重複日用
protocol WeekDaySelectViewDelegate:AnyObject {
    func receiveWeekSelectData(data:Set<Week>)
}

//傳輸鬧鐘時間
protocol CreateAlarmViewForClockDelegate:AnyObject{
    func receiveCreateAlarmViewForClock(data:Date)
}
//
////傳輸上午下午
//protocol CreateAlarmViewForAMPMDelegate:AnyObject{
//    func receiveCreateAlarmViewForAMPM(data:String)
//}
