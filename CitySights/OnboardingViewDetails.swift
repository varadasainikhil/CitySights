//
//  OnboardingViewDetails.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/5/25.
//

import SwiftUI

struct OnboardingViewDetails: View {
    let mainText : String
    let subText : String
    let bgColor : Color
    var buttonAction : () ->  Void
    
    var body: some View {
        ZStack{
            bgColor
            VStack{
                Image(.onboarding)
                
                Text(mainText)
                    .font(Font.system(size: 22).bold())
                    .padding(.top, 32)
                    .foregroundStyle(.white)
                
                Text(subText)
                    .padding(.top, 4)
                    .foregroundStyle(.white)
                
                Button{
                    buttonAction()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 350, height: 50)
                            .foregroundStyle(.white)
                            .shadow(radius: 15)
                        
                        Text("Continue")
                            .font(.title3)
                            .foregroundStyle(.black)
                            .bold()
                    }
                }
                .padding(.top, 81)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingViewDetails(mainText: "Welcome to City Sights", subText: "City Sights helps you find teh best of the city ", bgColor: Color(red: 111/255, green: 154/255, blue: 189/255)){
        // empty action
    }
}
