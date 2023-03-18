//
//  DetailViewModel.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/17.
//

import Foundation

class DetailViewModel : ObservableObject {
    @Published var selectedItem : TodayItem?
    @Published var show = false
    
    public func setItem(item : TodayItem?) {
        self.selectedItem = item
    }
}
