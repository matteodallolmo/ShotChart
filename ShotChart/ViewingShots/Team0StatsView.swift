//
//  TeamStatsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/16/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Team0StatsView: View {
    
    var team: String
    
    @State private var totalShots = 0
    @State private var criteria1 = "Position"
    @State private var phase = 1
    
    @State private var one = [Shot]()
    @State private var two = [Shot]()
    @State private var three = [Shot]()
    @State private var four = [Shot]()
    @State private var five = [Shot]()
    @State private var six = [Shot]()
    
    
    @State private var oneUP = [Shot]()
    @State private var twoUP = [Shot]()
    @State private var threeUP = [Shot]()
    @State private var fourUP = [Shot]()
    @State private var fiveUP = [Shot]()
    @State private var sixUP = [Shot]()
    
    
    @State private var direct = [Shot]()
    @State private var cas = [Shot]()
    @State private var fake = [Shot]()
    @State private var drive = [Shot]()
    @State private var pickup = [Shot]()
    @State private var backhand = [Shot]()
    @State private var quick6v5 = [Shot]()
    @State private var overpass = [Shot]()
    @State private var skip = [Shot]()
    @State private var lob = [Shot]()
    @State private var transition = [Shot]()
    
    
    @State private var oneLoc = [Shot]()
    @State private var twoLoc = [Shot]()
    @State private var threeLoc = [Shot]()
    @State private var fourLoc = [Shot]()
    @State private var fiveLoc = [Shot]()
    
    var body: some View {
GeometryReader { geometry in
VStack() {
Form {
    Picker(selection: $criteria1, label: Text("Sort By"), content: {
        Text("Position").tag("Position")
        Text("Type").tag("Type")
        Text("Location").tag("Location")
    })
    if(criteria1 == "Position") {
    Picker(selection: $phase, label: Text("Select Phase of Game"), content: {
        Text("6v6").tag(1)
        Text("6v5").tag(2)
    }).pickerStyle(SegmentedPickerStyle())
    }
     
     Button {
         retrieveCriteria(team: team, criteria: criteria1)
     } label: {
         Text("Load Data")
     }

}.frame(width: geometry.size.width, height: geometry.size.height/4.8, alignment: .center)
//form
ScrollView {
if(criteria1 == "Position" && phase == 1) {
VStack(spacing: 10) {
    
    Text("Total Shots: "+String(totalShots))
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 1), shotSelection: one, phase: 1),
        label: {
            PositionStatView(num: 1, shotsTaken: one.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 2), shotSelection: two, phase: 1),
        label: {
            PositionStatView(num: 2, shotsTaken: two.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 3), shotSelection: three, phase: 1),
        label: {
            PositionStatView(num: 3, shotsTaken: three.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 4), shotSelection: four, phase: 1),
        label: {
            PositionStatView(num: 4, shotsTaken: four.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 5), shotSelection: five, phase: 1),
        label: {
            PositionStatView(num: 5, shotsTaken: five.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 6), shotSelection: six, phase: 1),
        label: {
            PositionStatView(num: 6, shotsTaken: six.count)
        })
}//criteria vstack
}//if criteria1
else if(criteria1 == "Position" && phase == 2)
{
VStack(spacing: 10) {
    
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 1), shotSelection: oneUP, phase: 1),
        label: {
            PositionStatView(num: 1, shotsTaken: oneUP.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 2), shotSelection: twoUP, phase: 1),
        label: {
            PositionStatView(num: 2, shotsTaken: twoUP.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 3), shotSelection: threeUP, phase: 1),
        label: {
            PositionStatView(num: 3, shotsTaken: threeUP.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 4), shotSelection: fourUP, phase: 1),
        label: {
            PositionStatView(num: 4, shotsTaken: fourUP.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 5), shotSelection: fiveUP, phase: 1),
        label: {
            PositionStatView(num: 5, shotsTaken: fiveUP.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 6), shotSelection: sixUP, phase: 1),
        label: {
            PositionStatView(num: 6, shotsTaken: sixUP.count)
        })
}//criteria vstack
}//else phase 2
    
if(criteria1 == "Type") {
VStack(spacing: 10) {
    
    Group {
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 1), shotSelection: direct, phase: 1),
        label: {
            TypeStatView(num: 1, shotsTaken: direct.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 2), shotSelection: cas, phase: 1),
        label: {
            TypeStatView(num: 2, shotsTaken: cas.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 3), shotSelection: fake, phase: 1),
        label: {
            TypeStatView(num: 3, shotsTaken: fake.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 4), shotSelection: drive, phase: 1),
        label: {
            TypeStatView(num: 4, shotsTaken: drive.count)
        })
    }
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 5), shotSelection: pickup, phase: 1),
        label: {
            TypeStatView(num: 5, shotsTaken: pickup.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 6), shotSelection: backhand, phase: 1),
        label: {
            TypeStatView(num: 6, shotsTaken: backhand.count)
        })
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 7), shotSelection: quick6v5, phase: 1),
        label: {
            TypeStatView(num: 7, shotsTaken: quick6v5.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 8), shotSelection: overpass, phase: 1),
        label: {
            TypeStatView(num: 8, shotsTaken: overpass.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 9), shotSelection: skip, phase: 1),
        label: {
            TypeStatView(num: 9, shotsTaken: skip.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 10), shotSelection: lob, phase: 1),
        label: {
            TypeStatView(num: 10, shotsTaken: lob.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 11), shotSelection: transition, phase: 1),
        label: {
            TypeStatView(num: 11, shotsTaken: transition.count)
        })
}//criteria vstack
}//if criteria1
if(criteria1 == "Location") {
VStack(spacing: 10) {
    
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 1), shotSelection: oneLoc, phase: 1),
        label: {
            LocationStatView(num: 1, shotsTaken: oneLoc.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 2), shotSelection: twoLoc, phase: 1),
        label: {
            LocationStatView(num: 2, shotsTaken: twoLoc.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 3), shotSelection: threeLoc, phase: 1),
        label: {
            LocationStatView(num: 3, shotsTaken: threeLoc.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 1), shotSelection: fourLoc, phase: 1),
        label: {
            LocationStatView(num: 4, shotsTaken: fourLoc.count)
        })
    
    NavigationLink(
        destination: Team1StatsView(team: team, criteria1: KeyValue(key: criteria1, value: 1), shotSelection: fiveLoc, phase: 1),
        label: {
            LocationStatView(num: 5, shotsTaken: fiveLoc.count)
        })
}//criteria vstack
}//if criteria1
    Text("Results")
        .font(.title)
        .padding(.vertical)
    
    ResultsTable(team: team, criteria1: nil, criteria2: nil, criteria3: nil)
}//scrollview
}.navigationTitle(team + " Team Stats")//vstack
}//geometry
}//body
    
func retrieveCriteria(team: String, criteria: String) -> Void
{
    let db = Firestore.firestore()
    
    if(criteria == "Position") {
    
    if(phase == 1) {
    for n in 1...6 {
    db.collectionGroup(team+"Shots").whereField("Phase", isEqualTo: 1).whereField("Source", isEqualTo: n).getDocuments { snapshot, error in
        
        if(snapshot != nil && error == nil)
        {
            for doc in snapshot!.documents
            {
                let shot = Shot(doc: doc)
                
                if(n == 1 && !self.one.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.one.append(shot) }
                if(n == 2 && !self.two.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.two.append(shot) }
                if(n == 3 && !self.three.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.three.append(shot) }
                if(n == 4 && !self.four.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.four.append(shot) }
                if(n == 5 && !self.five.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.five.append(shot) }
                if(n == 6 && !self.six.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.six.append(shot) }
            }
        }
        else
        {
            print("THE ERROR WAS: "+error!.localizedDescription)
        }
        }
    }//for end
        
        totalShots = one.count+two.count+three.count+four.count+five.count+six.count
    }//if end
    
    else {
    for n in 1...6 {
        db.collectionGroup(team+"Shots").whereField("Phase", isEqualTo: 2).whereField("Source", isEqualTo: n).getDocuments { snapshot, error in
        
        if(snapshot != nil && error == nil)
        {
            for doc in snapshot!.documents
            {
                let shot = Shot(doc: doc)
                
                if(n == 1 && !self.oneUP.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.oneUP.append(shot) }
                if(n == 2 && !self.twoUP.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.twoUP.append(shot) }
                if(n == 3 && !self.threeUP.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.threeUP.append(shot) }
                if(n == 4 && !self.fourUP.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.fourUP.append(shot) }
                if(n == 5 && !self.fiveUP.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.fiveUP.append(shot) }
                if(n == 6 && !self.sixUP.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.sixUP.append(shot) }
            }
        }
        else
        {
            print("THE ERROR WAS: "+error!.localizedDescription)
        }
    }
    }//for end
        
        totalShots = oneUP.count+twoUP.count+threeUP.count+fourUP.count+fiveUP.count+sixUP.count
    }//else end
        
    }//if end
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if(criteria == "Type") {
    
    for n in 1...11 {
    db.collectionGroup(team+"Shots").whereField("Type", isEqualTo: n).getDocuments { snapshot, error in
        
        if(snapshot != nil && error == nil)
        {
            for doc in snapshot!.documents
            {
                let shot = Shot(doc: doc)
                
                if(n == 1 && !self.direct.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.direct.append(shot) }
                if(n == 2 && !self.cas.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.cas.append(shot) }
                if(n == 3 && !self.fake.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.fake.append(shot) }
                if(n == 4 && !self.drive.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.drive.append(shot) }
                if(n == 5 && !self.pickup.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.pickup.append(shot) }
                if(n == 6 && !self.backhand.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.backhand.append(shot) }
                if(n == 7 && !self.quick6v5.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.quick6v5.append(shot) }
                if(n == 8 && !self.overpass.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.overpass.append(shot) }
                if(n == 9 && !self.skip.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.skip.append(shot) }
                if(n == 10 && !self.lob.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.lob.append(shot) }
                if(n == 11 && !self.transition.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.transition.append(shot) }
            }
        }
        else{
            print("THE ERROR WAS: "+error!.localizedDescription)
        }
        }
    }//for end
        
        totalShots = direct.count+cas.count+fake.count+drive.count+pickup.count+backhand.count+quick6v5.count+overpass.count+skip.count+lob.count+transition.count
    }//if end
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if(criteria == "Location") {
    
    for n in 1...5 {
    db.collectionGroup(team+"Shots").whereField("Location", isEqualTo: n).getDocuments { snapshot, error in
        
        if(snapshot != nil && error == nil)
        {
            for doc in snapshot!.documents
            {
                let shot = Shot(doc: doc)
                
                if(n == 1 && !self.oneLoc.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.oneLoc.append(shot) }
                if(n == 2 && !self.twoLoc.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.twoLoc.append(shot) }
                if(n == 3 && !self.threeLoc.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.threeLoc.append(shot) }
                if(n == 4 && !self.fourLoc.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.fourLoc.append(shot) }
                if(n == 5 && !self.fiveLoc.contains(where: { temp in
                    if(shot.equals(temp: temp)) { return true }
                    return false }))
                { self.fiveLoc.append(shot) }
            }
        }
        else{
            print("THE ERROR WAS: "+error!.localizedDescription)
        }
        }
    }//for end
        
    totalShots = oneLoc.count+twoLoc.count+threeLoc.count+fourLoc.count+fiveLoc.count

    }//if end
}//func end
   /*
    func getSH(position: Int) -> Void {
        
        if(position == 1)
        {
            for shot in self.one {
                if shot.result == 1 { self.oneScored += 1 }
                self.oneTaken += 1
            }
            
            if(oneTaken == 0) { self.oneSP = 0; return }
            self.oneSP = Double(self.oneScored/self.oneTaken)
        }
        if(position == 2)
        {
            for shot in self.two {
                if shot.result == 1 { self.twoScored += 1 }
                self.twoTaken += 1
            }
            
            if(twoTaken == 0) { self.twoSP = 0; return }
            self.twoSP = Double(self.twoScored/self.twoTaken)
        }
        if(position == 3)
        {
            for shot in self.three {
                if shot.result == 1 { self.threeScored += 1 }
                self.threeTaken += 1
            }
            
            if(threeTaken == 0) { self.threeSP = 0; return }
            self.threeSP = Double(self.threeScored/self.threeTaken)
        }
        if(position == 4)
        {
            for shot in self.four {
                if shot.result == 1 { self.fourScored += 1 }
                self.fourTaken += 1
            }
            
            if(fourTaken == 0) { self.fourSP = 0; return }
            self.fourSP = Double(self.fourScored/self.fourTaken)
        }
        if(position == 5)
        {
            for shot in self.five {
                if shot.result == 1 { self.fiveScored += 1 }
                self.fiveTaken += 1
            }
            
            if(fiveTaken == 0) { self.fiveSP = 0; return }
            self.fiveSP = Double(self.fiveScored/self.fiveTaken)
        }
        if(position == 6)
        {
            for shot in self.six {
                if shot.result == 1 { self.sixScored += 1 }
                self.sixTaken += 1
            }
            
            if(sixTaken == 0) { self.sixSP = 0; return }
            self.sixSP = Double(self.sixScored/self.sixTaken)
        }
    }
    */
}//struct
