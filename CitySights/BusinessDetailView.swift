//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/3/25.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business : Business?
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
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                    
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.address2 ?? ""), \(business?.location?.address3 ?? "")")

                    Text("\(business?.location?.city ?? ""), \(business?.location?.state ?? ""), \(business?.location?.country ?? "") - \(business?.location?.zipCode ?? "") ")
                        .padding(.bottom, 10)
                    
                    Image(RatingHelper.roundRatings(unroundedRating: business?.rating ?? 0))
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack{
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack{
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
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
