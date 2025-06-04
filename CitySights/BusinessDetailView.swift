//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/3/25.
//

import SwiftUI

struct BusinessDetailView: View {
    @Environment(BusinessViewModel.self) var viewModel
    
    var body: some View {
        VStack{
            ZStack(alignment: .trailing){
                Image(.detailPlaceholder)
                    .resizable()
                    
                VStack(spacing: 0){
                    Spacer()
                    Image(.yelpAttribution)
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            
            if let isClosed = viewModel.selectedBusiness?.isClosed{
                ZStack(alignment: .leading){
                    Rectangle()
                        .foregroundStyle(isClosed ? .red : .green)
                    
                    Text(isClosed ? "Closed" : "Open")
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                }
                .frame(height: 36)
                
            }
            
            ScrollView{
                VStack(alignment : .leading, spacing: 0){
                    Text(viewModel.selectedBusiness?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                    
                    Text("\(viewModel.selectedBusiness?.location?.address1 ?? ""), \(viewModel.selectedBusiness?.location?.address2 ?? ""), \(viewModel.selectedBusiness?.location?.address3 ?? "")")

                    Text("\(viewModel.selectedBusiness?.location?.city ?? ""), \(viewModel.selectedBusiness?.location?.state ?? ""), \(viewModel.selectedBusiness?.location?.country ?? "") - \(viewModel.selectedBusiness?.location?.zipCode ?? "") ")
                        .padding(.bottom, 10)
                    
                    Image(RatingHelper.roundRatings(unroundedRating: viewModel.selectedBusiness?.rating ?? 0))
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "phone")
                        Text(viewModel.selectedBusiness?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack{
                        Image(systemName: "globe")
                        Text(viewModel.selectedBusiness?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack{
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(viewModel.selectedBusiness?.reviewCount ?? 0) reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    BusinessDetailView()
}
