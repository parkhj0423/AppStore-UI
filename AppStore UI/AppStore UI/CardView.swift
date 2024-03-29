//
//  CardView.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/15.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.colorScheme) var color
    var item : TodayItem
    
    var animation : Namespace.ID
    
    var body: some View {
        VStack(spacing : 0) {
            Image(item.contentImage)
                .resizable()
                .matchedGeometryEffect(id: item.contentImage, in: animation)
                .frame(height: 250)
               
            
            HStack {
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing : 6) {
                    Text(item.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text(item.category)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button {
                        
                    } label: {
                        Text("GET")
                            .font(.system(size: 14, weight: .bold))
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    
                    Text("In App Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
            }
            .frame(height : 50)
            .padding()
            .background(Color.primary.opacity(0.4))
            .matchedGeometryEffect(id: item.id, in: animation)
           
        }
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
    }
}

