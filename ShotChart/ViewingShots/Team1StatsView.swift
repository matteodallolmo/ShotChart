//
//  Team1StatsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/26/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Team1StatsView: View {
    
    var team: String
    var phase: Int
    var criteria1: KeyValue
    var shotSelection: [Shot]
    
    @State private var totalShots = 0
    @State private var criteria2 = 0
    
    @State private var newShots = [Shot]()
    
    var body: some View {
        Text("hello")
    }
}//struct
