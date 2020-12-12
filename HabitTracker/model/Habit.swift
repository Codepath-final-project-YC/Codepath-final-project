//
//  Habit.swift
//  HabitTracker
//
//  Created by Yike Li on 12/12/20.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Habit: Identifiable {
    var id: String
    var name: String
    var category: String
    var color: Int
    var percentage: Double
    var active: Bool
    
    func updateData(){
        let db = Firestore.firestore()
        let userId: String = Auth.auth().currentUser!.uid
        let habitid: String = "P3CmC1OnxZAKGqaio7q5"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today: String = formatter.string(from: Date())
        let ref = db.collection("habits").document(userId).collection("habit").document(id)
        ref.updateData([
            "finishedDates": FieldValue.arrayUnion([today])
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
