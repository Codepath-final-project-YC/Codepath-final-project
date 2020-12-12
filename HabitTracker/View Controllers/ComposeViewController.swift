//
//  ComposeViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 12/1/20.
//

import UIKit
import Firebase
import SwiftUI
import KMPlaceholderTextView
extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
class ComposeViewController: UIViewController {
    var cate:String = ""
    var daysToTrack: [Bool] = [false, false, false, false, false, false, false]
    var cateColor:Int = 10
    var datesOfThatWeek: [String] = []
    
    var weekTotal = 0
    
    
    let colorPalettes: [Color] = [Color("CarnationPink"), Color("Mantis"), Color("UranianBlue"), Color("PeachCrayola"), Color("EnglishRed"), Color("MaizeCrayola"), Color("RoyalBlueLight"), Color("OrangeWeb"), Color("Rhythm"), Color("OrangePantone") ]
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    

    @IBOutlet weak var descriptionTextView: KMPlaceholderTextView!
    
    
    
    @IBOutlet weak var cateSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var SundayButton: UIButton!
    @IBOutlet weak var MondayButton: UIButton!
    @IBOutlet weak var TuesdayButton: UIButton!
    @IBOutlet weak var WednesdayButton: UIButton!
    @IBOutlet weak var ThursdayButton: UIButton!
    @IBOutlet weak var FridayButton: UIButton!
    @IBOutlet weak var SaturdayButton: UIButton!
    
    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var Color0Button: UIButton!
    @IBOutlet weak var Color1Button: UIButton!
    @IBOutlet weak var Color2Button: UIButton!
    @IBOutlet weak var Color3Button: UIButton!
    @IBOutlet weak var Color4Button: UIButton!
    @IBOutlet weak var Color5Button: UIButton!
    @IBOutlet weak var Color6Button: UIButton!
    @IBOutlet weak var Color7Button: UIButton!
    @IBOutlet weak var Color8Button: UIButton!
    @IBOutlet weak var Color9Button: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorButtons()

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.identifier == "composeToTrack" {
            guard segue.destination is NormalTrackHabitViewController else { return }

        }

    }
    func setColorButtons(){
        
        
        nameTextField.backgroundColor = UIColor(Color("BGColor"))
        
        Color0Button.tintColor = UIColor(colorPalettes[0])
        Color1Button.tintColor = UIColor(colorPalettes[1])
        Color2Button.tintColor = UIColor(colorPalettes[2])
        Color3Button.tintColor = UIColor(colorPalettes[3])
        Color4Button.tintColor = UIColor(colorPalettes[4])
        Color5Button.tintColor = UIColor(colorPalettes[5])
        Color6Button.tintColor = UIColor(colorPalettes[6])
        Color7Button.tintColor = UIColor(colorPalettes[7])
        Color8Button.tintColor = UIColor(colorPalettes[8])
        Color9Button.tintColor = UIColor(colorPalettes[9])

        nameTextField.layer.cornerRadius = 10

        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 2
        descriptionTextView.layer.borderColor = UIColor(Color("BGColor")).cgColor
        descriptionTextView.textColor = UIColor.darkGray

    }
    
    
    @IBAction func composeButtonOnClicked(_ sender: Any) {
        let name = nameTextField.text
        let description = descriptionTextView.text
        let startDate = addDate()
        let finishedDates: [String] = []
        let user = Auth.auth().currentUser
        var userId:String = "0CcchhusZAbmIt3rfyp0IkTlv923"
        if let user = user {
            userId = user.uid
        }

        let db = Firestore.firestore()
        // Do any additional setup after loading the view.
        let newDocument = db.collection("habits").document(userId).collection("habit").document()
        let habitID = newDocument.documentID as? String
        newDocument.setData(["habitID": habitID, "name": name, "description": description, "category": cate, "color": cateColor, "startDate": startDate, "datesOfThatWeek":  datesOfThatWeek, "finishedDates": finishedDates, "active": true])
        
        performSegue(withIdentifier: "composeToTrack", sender: self)
    }
    
    
    func addDate() -> String {
        
        let dateInWeek = Date().dayBefore.dayBefore.dayBefore.dayBefore
        print(dateInWeek)
        let calendar = Calendar(identifier: .gregorian)

        let dayOfWeek = calendar.component(.weekday, from: dateInWeek)
        
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: dateInWeek)!
        let days = (dayOfWeek ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: dateInWeek) }
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        for (idx, day) in days.enumerated() {
            if  daysToTrack[7 - dayOfWeek - 1 + idx - 1] {
                let dateString = formatter.string(from: day)
                datesOfThatWeek.append(dateString)
            }
        }
        return datesOfThatWeek[0]
    }
    
    
    
    @IBAction func cateSelected(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            cate = "Physical"
        case 1:
            cate = "Mental"
        case 2:
            cate = "Emotional"
        case 3:
            cate = "Spiritual"
        default:
            cate = "Physical"
        }
    }
    
    func buttonChange(dayChosed: Bool, dayButton: UIButton, fillImage: UIImage, image: UIImage) {
        
        if dayChosed {
            dayButton.setImage(fillImage, for: .normal)
        }else{
            dayButton.setImage(image, for: .normal)
        }

    }
    
    @IBAction func SundayOnClicked(_ sender: Any) {
        daysToTrack[0].toggle()
        
        buttonChange(dayChosed: daysToTrack[0], dayButton: SundayButton, fillImage: UIImage(systemName: "s.circle.fill")!, image: UIImage(systemName: "s.circle")!)
        
    }
    
    @IBAction func MondayOnClicked(_ sender: Any) {
        
        daysToTrack[1].toggle()
        
        buttonChange(dayChosed: daysToTrack[1], dayButton: MondayButton, fillImage: UIImage(systemName: "m.circle.fill")!, image: UIImage(systemName: "m.circle")!)
        
    }
    @IBAction func TuesdayOnClicked(_ sender: Any) {
        daysToTrack[2].toggle()
        
        buttonChange(dayChosed: daysToTrack[2], dayButton: TuesdayButton, fillImage: UIImage(systemName: "t.circle.fill")!, image: UIImage(systemName: "t.circle")!)
        
        
    }
    @IBAction func WednesdayOnClicked(_ sender: Any) {
        daysToTrack[3].toggle()
        
        buttonChange(dayChosed: daysToTrack[3], dayButton: WednesdayButton, fillImage: UIImage(systemName: "w.circle.fill")!, image: UIImage(systemName: "w.circle")!)
        
    }
    
    
    @IBAction func ThursdayOnClicked(_ sender: Any) {
        daysToTrack[4].toggle()
        
        buttonChange(dayChosed: daysToTrack[4], dayButton: ThursdayButton, fillImage: UIImage(systemName: "t.circle.fill")!, image: UIImage(systemName: "t.circle")!)
        
        
    }
    
    @IBAction func FridayOnClicked(_ sender: Any) {
        daysToTrack[5].toggle()
        
        buttonChange(dayChosed: daysToTrack[5], dayButton: FridayButton, fillImage: UIImage(systemName: "f.circle.fill")!, image: UIImage(systemName: "f.circle")!)
        
        
    }
    
    @IBAction func SaturdayOnClicked(_ sender: Any) {
        daysToTrack[6].toggle()
        
        buttonChange(dayChosed: daysToTrack[6], dayButton: SaturdayButton, fillImage: UIImage(systemName: "s.circle.fill")!, image: UIImage(systemName: "s.circle")!)
        
    }
    
    
    @IBAction func Color0OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[0])
        cateColor = 0
    }
    
    @IBAction func Color1OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[1])
        cateColor = 1
    }
    
    @IBAction func Color2OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[2])
        cateColor = 2
    }
    
    @IBAction func Color3OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[3])
        cateColor = 3
    }
    
    @IBAction func Color4OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[4])
        cateColor = 4
    }
    
    @IBAction func Color5OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[5])
        cateColor = 5
    }
    
    @IBAction func Color6OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[6])
        cateColor = 6
    }
    
    @IBAction func Color7OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[7])
        cateColor = 7
    }
    
    @IBAction func Color8OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[8])
        cateColor = 8
    }
    
    @IBAction func Color9OnClicked(_ sender: Any) {
        nameTextField.backgroundColor = UIColor(colorPalettes[9])
        cateColor = 9
    }
    
    
    
    
}
