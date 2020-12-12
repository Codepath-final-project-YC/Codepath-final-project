//
//  habitViewModel.swift
//  HabitTracker
//
//  Created by Yike Li on 12/12/20.
//

import Foundation
import FirebaseFirestore
import Firebase

class HabitsViewModel: ObservableObject {
    @Published var habits = [Habit]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        
        let user = Auth.auth().currentUser
        var userId:String = "0CcchhusZAbmIt3rfyp0IkTlv923"
        if let user = user {
            userId = user.uid
        }

        db.collection("habits").document(userId).collection("habit").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
            self.habits = documents.map { (QueryDocumentSnapshot) -> Habit in
                let data = QueryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let category = data["category"] as? String ?? ""
                let color = data["color"] as? Int ?? 10
                
                let datesOfThatWeek = data["datesOfThatWeek"] as? [String] ?? [""]
                let finishedDates = data["finishedDates"] as? [String] ?? [""]
                let active = data["active"] as? Bool ?? false
                
                let percentage = finishedDates.count / datesOfThatWeek.count
                
                return Habit(name: name, category: category, color: color, percentage:percentage, active: active)
            }
        }
        
        
    }
}
