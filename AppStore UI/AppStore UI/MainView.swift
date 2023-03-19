//
//  MainView.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/08.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    @Namespace var animation
    @StateObject var detailViewModel = DetailViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(items) { item in
                    CardView(item: item, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                detailViewModel.setItem(item: item)
                                detailViewModel.show.toggle()
                            }
                        }
                }
                .padding(.bottom)
            }
            
            if let item = detailViewModel.selectedItem, detailViewModel.show {
                DetailView(viewModel: detailViewModel, item : item, animation: animation)
            }
        }
        .background(Color.primary.opacity(0.1).ignoresSafeArea())
    }
}

struct MainViewProvider_Previews: PreviewProvider {
    @Namespace var animation
    static var previews: some View {
        MainView()
    }
}
