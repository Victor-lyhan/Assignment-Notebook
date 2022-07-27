//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Victor Han on 2022/7/26.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items: [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey : "data")
            }
        }
    }
    init(){
        if let items = UserDefaults.standard.data(forKey: "data"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: items){
                self.items = decoded
                return
            }
        }
        items = []
    }
}
