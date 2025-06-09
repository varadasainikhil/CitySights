//
//  OnboardingView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/5/25.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(BusinessViewModel.self) var viewModel
    @State private var currentPage : Int = 0
    
    var body: some View {
        ZStack{
            if currentPage == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            } else {
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            
            TabView(selection: $currentPage){
                OnboardingViewDetails(mainText: "Welcome to City Sights", subText: "City Sights helps you find the best of the city ", bgColor: Color(red: 111/255, green: 154/255, blue: 189/255)){
                    withAnimation{
                        currentPage = 1
                    }
                }
                .tag(0)
                
                OnboardingViewDetails(mainText: "Discover your city", subText: "We will show you the best restaurants, venue ", bgColor: Color(red: 139/255, green: 166/255, blue: 65/255)){
                    dismiss()
                    viewModel.checkAuthorizationAndRequestLocation()
                }
                .tag(1)
            }
                .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack{
                Spacer()
                Spacer()
                
                HStack{
                    Circle()
                        .frame(width: 7)
                        .foregroundStyle(currentPage == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 7)
                        .foregroundStyle(currentPage == 1 ? .white : .gray)
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    OnboardingView()
}
