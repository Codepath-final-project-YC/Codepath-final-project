//
//  UITrackHabit.swift
//  HabitTracker
//
//  Created by Yike Li on 12/8/20.
//

import SwiftUI


struct UITrackHabit: View {
    @ObservedObject private var viewModel = HabitsViewModel()
    
    let colorPalettes: [Color] = [Color("CarnationPink"), Color("Mantis"), Color("UranianBlue"), Color("PeachCrayola"), Color("EnglishRed"), Color("MaizeCrayola"), Color("RoyalBlueLight"), Color("OrangeWeb"), Color("Rhythm"), Color("OrangePantone"),  Color("BGColor")]
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 40) {
            ForEach(viewModel.habits) {
                habit in
                Button(action: {
                        print("Hello Function 2")
                }, label: {
                    SpecialButton(buttonText: habit.name, buttonColor: colorPalettes[habit.color], buttonPercentage: Double(habit.percentage))})
            }
        }.onAppear(){
            self.viewModel.fetchData()}
    
    }
}

struct UITrackHabit_Previews: PreviewProvider {
    static var previews: some View {
        UITrackHabit()
    }
}
