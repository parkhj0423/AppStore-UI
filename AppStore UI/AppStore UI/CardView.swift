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
    
    var body: some View {
        VStack {
            Image(item.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
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
            .padding()
            .background(Color.primary.opacity(0.4))
           
        }
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(item: items.first!)
    }
}
