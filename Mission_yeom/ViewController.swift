//
//  ViewController.swift
//  Mission_yeom
//
//  Created by 염성필 on 2023/07/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calendarPicker: UIDatePicker!
    
    @IBOutlet var addDaysCollection: [UILabel]!
    
    @IBOutlet var mainCalendarTextCollection: [UILabel]!
   
    @IBOutlet var backgroundImages: [UIImageView]!
    @IBOutlet var ImageBgCollection: [UIView]!
    
    
    let imageName: [String] = ["왕의남자", "태극기휘날리며", "택시운전사", "해운대"]
    
    let addDayText: [String] = ["D + 100", "D + 200", "D + 300", "D + 400"]
    
    var selectedName: [String] = []
    let addNumber: [Int] = [100, 200, 300, 400]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBackGround()
        addDays()
        settingShadowBg()
        firstValue()
    }
    
    func addDays() {
        for addDay in 0..<addDaysCollection.count {
            addDaysCollection[addDay].text = addDayText[addDay]
            addDaysCollection[addDay].textColor = .white
            addDaysCollection[addDay].font = UIFont.systemFont(ofSize: 20, weight: .black)
        }
    }
    
    func firstValue() {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yy년 MM월 dd일"
        let result = dateFormat.string(from: Date.now)
        
        for mainTextCalendar in mainCalendarTextCollection {
            mainTextCalendar.text = result
            mainTextCalendar.textColor = .white
        }
    }
    
    func settingBackGround() {
        // backGround 설정
        for index in 0..<backgroundImages.count {
           
            backgroundImages[index].image = UIImage(named: imageName[index])
            backgroundImages[index].layer.cornerRadius = 10
            backgroundImages[index].clipsToBounds = true
            backgroundImages[index].contentMode = .scaleToFill
            // shadow 설정
            self.selectedName.append(imageName[index])
            print("selectedName",selectedName)
        }
    }
    
    func settingShadowBg() {
        
        for imageBg in ImageBgCollection {
        
            imageBg.layer.shadowColor = UIColor.green.cgColor
            imageBg.layer.shadowOffset = .zero
            imageBg.layer.shadowOpacity = 1
            imageBg.layer.cornerRadius = 10
            imageBg.layer.masksToBounds = false
        }
    }
    
    
    @IBAction func calendarPickerValueChagedClicked(_ sender: UIDatePicker) {
        
        for mainCalender in 0..<mainCalendarTextCollection.count {
            mainCalendarTextCollection[mainCalender].text = calculateCalendar(addNumber[mainCalender], calendarCurrent: sender.date)
            mainCalendarTextCollection[mainCalender].textColor = .white
//            mainCalendarTextCollection[mainCalender].font = UIFont.systemFont(ofSize: 20)
        }
   
        
    }
    
    func calculateCalendar(_ value: Int, calendarCurrent: Date) -> String {
        
        let calendar = Calendar.current
        
        let resultCal = calendar.date(byAdding: .day, value: value, to: calendarCurrent)
        
        guard let resultCal = resultCal else { return "옵셔날 값?" }
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yy년 MM월 dd일"
        
        let result = dateFormat.string(from: resultCal)
        return result
    }
    
    @IBAction func imageTapped(_ sender: UIGestureRecognizer) {
        
        print(#fileID, #function, #line,"- 탭 눌렸음 " )
        print("detailImage \(sender.view?.tag)",selectedName)
        
    }
    
    @IBAction func unWind(_ segue: UIStoryboardSegue) {
        
        print(#fileID, #function, #line,"- 뒤로가기" )
        print("detailImage",selectedName)
    }

}

