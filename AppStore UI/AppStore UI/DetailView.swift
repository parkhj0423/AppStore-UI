//
//  DetailView.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/17.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var detail : DetailViewModel
    var animation : Namespace.ID
    
    var body: some View {
        ScrollView {
            VStack(spacing : 0) {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    Image(detail.selectedItem.contentImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: detail.selectedItem.contentImage, in: animation)
                        .frame(width : UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                    
                    HStack {
                        Text(detail.selectedItem.overlay)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                detail.show.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .padding()
                                .background(.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                }
                
                
                HStack {
                    Image(detail.selectedItem.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing : 6) {
                        Text(detail.selectedItem.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Text(detail.selectedItem.category)
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
                .matchedGeometryEffect(id: detail.selectedItem.id, in: animation)
                .padding()
                .background(Color.red)
                
                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.\n\n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.\n\n The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")
                    .foregroundColor(.black)
                    .padding()
                
                Spacer()
            }
        }
        .background(Color.white.ignoresSafeArea())
        .ignoresSafeArea(.all, edges: .top)
    }
}
