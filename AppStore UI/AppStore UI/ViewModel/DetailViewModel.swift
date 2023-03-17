//
//  DetailViewModel.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/17.
//

import Foundation

class DetailViewModel : ObservableObject {
    @Published var selectedItem = TodayItem(title: "", category: "", overlay: "", contentImage: "", logo: "")
    @Published var show = false
}
