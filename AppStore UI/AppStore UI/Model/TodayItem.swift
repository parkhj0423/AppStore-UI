//
//  TodayITem.swift
//  AppStore UI
//
//  Created by 박현우 on 2023/03/15.
//

import Foundation


struct TodayItem : Identifiable {
    var id = UUID().uuidString
    var title : String
    var category : String
    var overlay : String
    var contentImage : String
    var logo : String
}

var items =  [
    TodayItem(title: "Forza Street", category: "Ultimate Street Racing Game", overlay: "GAME OF THE DAY", contentImage: "b1", logo: "l1")
    TodayItem(title: "Roblox", category: "Adventure", overlay: "Lil Nas X Performs In Roblox", contentImage: "b2", logo: "l2")
    
]
