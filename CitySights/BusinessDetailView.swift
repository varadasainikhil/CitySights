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
        let business = viewModel.selectedBusiness
        VStack{
            ZStack(alignment: .trailing){
                if let imageUrl = business?.imageURL, imageUrl != ""{
                    // Get the image
                    AsyncImage(url: URL(string: imageUrl)!) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            
                            
                    } placeholder: {
                        ProgressView()
            
                    }

                }
                else{
                    // Place holder image()
                    Image(.detailPlaceholder)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()

                }
                
                VStack(spacing: 0){
                    Spacer()
                    Image(.yelpAttribution)
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 180)
            
            if let isClosed = business?.isClosed{
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
                    
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.address2 ?? ""), \(business?.location?.address3 ?? "")")

                    Text("\(business?.location?.city ?? ""), \(viewModel.selectedBusiness?.location?.state ?? ""), \(business?.location?.country ?? "") - \(business?.location?.zipCode ?? "") ")
                        .padding(.bottom, 10)
                    
                    Image(RatingHelper.roundRatings(unroundedRating: business?.rating ?? 0))
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "phone")
                        if let url = URL(string: "tel:\(business?.phone ?? "")"){
                            Link(destination: url) {
                                Text(business?.phone ?? "")
                            }
                        } else{
                            Text(business?.phone ?? "")
                        }
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack{
                        Image(systemName: "globe")
                        
                        if let url = URL(string: "\(business?.url ?? "" )"){
                            Link(destination: url) {
                                Text(business?.url ?? "")
                                    .lineLimit(1)
                            }
                        }
                        else{
                            Text(business?.url ?? "")
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack{
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(viewModel.selectedBusiness?.reviewCount ?? 0) reviews")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                }
                .padding()
                .background(.white)
                
            }
        }
    }
}

#Preview {
    BusinessDetailView()
        .environment(BusinessViewModel())
}
