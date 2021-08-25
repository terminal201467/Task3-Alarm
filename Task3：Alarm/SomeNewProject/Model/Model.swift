//
//  Concentration.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/13.
//

import UIKit

enum Section{
    case sleep,other
    var sectionTitle:String{
        switch self{
        case .sleep:
            return "睡眠"
        case .other:
            return "其他"
        }
    }
}
enum ClockCoice{
    case getUPAlarmCell(model:getUpAlarm)
    case ClockCell(model:Clock)
}

struct getUpAlarm{
    var name:String
    var date:Date
    var pickDay:Set<Week> = []
    var ringTime:String
}

struct Clock:Codable{
    var name:String
    var date:Date
    var pickDay:Set<Week> = []
    var isOn:Bool
    var repeatDay:String{
        switch pickDay {
        case [.Mon,.Tue,.Wed,.Thu,.Fri]:
            return "平日"
        case [.Sat,.Sun]:
            return "週末"
        case [.Mon,.Tue,.Wed,.Thu,.Fri,.Sat,.Sun]:
            return "每天"
        case []:
            return "永不"
        default:
            return pickDay
                //這裡的目的是要讓選項排序
                .sorted(by: {$0.rawValue < $1.rawValue})
                //這邊則是引用鬧鐘的週一到週五的細節
                .map({$0.detail})
                //這裡的用意是讓pickDay全部join進去鬧鐘裡面
                .joined(separator: " ")
            }
        }
    var modeSelect:Mode
    // 這邊在做的事情是讓加入的時間可以出現
    var appearString:String{
        switch pickDay {
        case [.Mon,.Tue,.Wed,.Thu,.Fri]:
            return "平日"
        case [.Sat,.Sun]:
            return "週末"
        case [.Mon,.Tue,.Wed,.Thu,.Fri,.Sat,.Sun]:
            return "每天"
        case []:
            return ""
            //這邊要做的事情是
        default:
            //如果點選的選項大於1的話
            if pickDay.count > 1{
                //回傳排序後、有細節的字串，然後把它加在一起
                return "，" + pickDay.sorted(by: {$0.rawValue < $1.rawValue}).map{$0.detail}.joined(separator: " ")
            }
            //如果沒有的話
            return pickDay.sorted(by: {$0.rawValue < $1.rawValue}).map{$0.detail}.joined(separator: " ")
        }
    }
    //這邊是讓上午、下午的字樣可以出現
    func appearTime()->(String){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let alarmTime = formatter.string(from: date)
        return alarmTime
    }
    //上午下午
    func appearTimeAMPM()->(String){
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        let alarmAMPM = formatter.string(from: date)
        if alarmAMPM == "AM" {
            return "上午"
        }else{
            return "下午"
        }
    }
}
enum Week:Int,CaseIterable,Codable{
    case Sun = 0,Mon,Tue,Wed,Thu,Fri,Sat
    var text:String{
        switch self {
        case .Sun:
            return "星期日"
        case .Mon:
            return "星期一"
        case .Tue:
            return "星期二"
        case .Wed:
            return "星期三"
        case .Thu:
            return "星期四"
        case .Fri:
            return "星期五"
        case .Sat:
            return "星期六"
        }
    }
    var detail:String{
        switch self {
        case .Sun:
            return "週日"
        case .Mon:
            return "週一"
        case .Tue:
            return "週二"
        case .Wed:
            return "週三"
        case .Thu:
            return "週四"
        case .Fri:
            return "週五"
        case .Sat:
            return "週六"
        }
    }
}

enum CellTitle {
    case SettingCellTitle(model:SettingCellTitle)
    case RingCellTitle(model:RingCellTitle)
}

enum SettingCellTitle:String,Codable {
    case repeatDay,label,ringing
    var item:String{
        switch self {
        case .repeatDay:
            return "重複"
        case .label:
            return "標籤"
        case .ringing:
            return "提示聲"
        }
    }
}

enum RingCellTitle:String,Codable {
    case remindLater
    var item:String{
        switch self {
        case .remindLater:
            return "稍後提醒"
        }
    }
}

enum Mode:String,Codable{
    case create,edit
    var title:String{
        switch self {
        case .create:
            return "加入鬧鐘"
        case .edit:
            return "編輯鬧鐘"
        }
    }
}
        
