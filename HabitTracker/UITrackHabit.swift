//
//  UITrackHabit.swift
//  HabitTracker
//
//  Created by Yike Li on 12/8/20.
//

import SwiftUI

struct UITrackHabit: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                print("Hello Function 2")
            }, label: {
                SpecialButton(buttonText: "WAKE UP EARLY", buttonColor: Color("RedColor"), buttonPercentage: 0.9)
                
            })
            Button(action: {
                print("Hello Function 2")
            }, label: {
                SpecialButton(buttonText: "WORKOUT", buttonColor: Color("BlueColor"), buttonPercentage: 0.7)
                
            })
            Button(action: {
                print("Hello Function 2")
            }, label: {
                SpecialButton(buttonText: "8 CUPS OF WATER", buttonColor: Color(.yellow), buttonPercentage: 0.3)
                
            })
        }
    }
}

struct UITrackHabit_Previews: PreviewProvider {
    static var previews: some View {
        UITrackHabit()
    }
}
