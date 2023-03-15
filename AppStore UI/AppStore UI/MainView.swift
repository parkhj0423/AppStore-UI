//
//  MainView.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/08.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                
            }
        }
        .background(Color.primary.opacity(0.05).ignoresSafeArea())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
