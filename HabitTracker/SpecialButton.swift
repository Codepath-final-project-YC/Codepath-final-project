//
//  SpecialButton.swift
//  ColorButton
//
//  Created by Brian Advent on 05.04.20.
//  Copyright © 2020 Brian Advent. All rights reserved.
//

import SwiftUI

struct SpecialButton: View {
    var buttonText = "WORK OUT"
    var buttonColor = Color("RedColor")
    var buttonPercentage = 0.7
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 250, height: 55)
                .foregroundColor(Color("BGColor"))
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: CGFloat(buttonPercentage) * 200, height: 55)
                .foregroundColor(buttonColor)
                
            Text(buttonText).bold()
                .frame(width: 250, height: 55)
                .foregroundColor(.black)
        }
    }
}


struct SpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        SpecialButton()
    }
}
