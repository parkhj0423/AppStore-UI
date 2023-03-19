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
    TodayItem(title: "Mountain", category: "Hardest Mountain Ever!!", overlay: "Mountain", contentImage: "mountain", logo: "mountainLogo"),
    TodayItem(title: "Sky", category: "Feel Free!", overlay: "Beautiful Sky", contentImage: "sky", logo: "skyLogo"),
    TodayItem(title: "Tree", category: "Peaceful And Calmness", overlay: "Tree Alone", contentImage: "tree", logo: "treeLogo")
    
]
