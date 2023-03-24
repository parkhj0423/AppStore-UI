//
//  DetailView.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/17.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel : DetailViewModel
    var item : TodayItem
    var animation : Namespace.ID
    
    @State var scale : CGFloat = 1
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing : 0) {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    Image(item.contentImage)
                        .resizable()
                        .matchedGeometryEffect(id: item.contentImage, in: animation)
                        .frame(width : UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                    
                    HStack {
                        Text(item.overlay)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                viewModel.setItem(item: nil)
                                viewModel.show.toggle()
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
                }.gesture(
                    DragGesture()
                        .onChanged(onChanged(value:))
                        .onEnded(onEnded(value:))
                )
                
                
                HStack {
                    Image(item.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing : 6) {
                        Text(item.title)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        Text(item.category)
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Text("GET")
                                .font(.system(size: 14, weight: .bold))
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                .background(Color.black.opacity(0.3))
                                .clipShape(Capsule())
                        }
                        
                        Text("In App Purchases")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                }
                .matchedGeometryEffect(id: item.id, in: animation)
                .padding()
                
                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.\n\n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.\n\n The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")
                    .foregroundColor(.black)
                    .padding()
                
                
            }
        }
        .scaleEffect(scale)
        .background(Color.white.ignoresSafeArea())
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func onChanged(value : DragGesture.Value) {
        // scale value를 전체 높이에 비례하여 계산
        let scale = value.translation.height / UIScreen.main.bounds.height
        print(1 - scale)
        if 1 - scale > 0.7 {
            self.scale = 1 - scale
        }
        
    }
    
    func onEnded(value : DragGesture.Value) {
        withAnimation(.spring()) {
            if scale < 0.9 {
                viewModel.setItem(item: nil)
                viewModel.show.toggle()
                
            } else {
                scale = 1
            }
        }
    }
}
