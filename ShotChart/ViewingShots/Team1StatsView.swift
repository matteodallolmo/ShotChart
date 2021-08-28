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
    var criteria1: KeyValue
    var shotSelection: [Shot]
    @State var phase: Int
    
    @State private var totalShots = 0
    @State private var criteria2 = ""
    @State private var shootingPercentage = 0.0
    
    @State private var newShots = [Shot]()
    
var body: some View {
        
GeometryReader { geometry in
VStack {
    Form {
        
        if(criteria1.key == "Position") {
        Picker(selection: $criteria2, label: Text("Sort By"), content: {
            Text("Type").tag("Type")
            Text("Location").tag("Location")
        })
        }
        
        else if(criteria1.key == "Type") {
            Picker(selection: $criteria2, label: Text("Sort By"), content: {
                Text("Position").tag("Position")
                Text("Location").tag("Location")
            })
        }
        
        else {
            Picker(selection: $criteria2, label: Text("Sort By"), content: {
                Text("Position").tag("Position")
                Text("Type").tag("Type")
            })
        }
        
        if(criteria2 == "Position") {
            Picker(selection: $phase, label: Text("Select Phase of Game"), content: {
                Text("6v6").tag(1)
                Text("6v5").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
        }
            
        Button {
            
            getSP()
            
        } label: {
            Text("Load Data")
        }

        
    }.frame(width: geometry.size.width, height: geometry.size.height/4.8, alignment: .center)
    
    Text("Shooting Percentage: "+String(shootingPercentage.rounded())+"%")
        
}.navigationTitle(criteria1.key+": "+String(criteria1.value))
//vstack
}//geometry
}//body
    
func getSP() -> Void {
    
    var goals = 0.0
    
    for shot in shotSelection {
        
        if(shot.result == 1) {
            goals += 1
        }
    }
    
    shootingPercentage = Double(goals/Double(shotSelection.count))*100
}
    
}//struct

struct Team1StatsView_Previews: PreviewProvider {
    static var previews: some View {
        Team1StatsView(team: "Loyola", criteria1: KeyValue(key: "Position", value: 1), shotSelection: [Shot](), phase: 1)
    }
}
