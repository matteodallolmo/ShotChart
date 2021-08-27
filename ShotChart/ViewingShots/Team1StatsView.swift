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
    var phase: String
    var criteria1: KeyValue
    var shotSelection: [Shot]
    
    @State private var totalShots = 0
    @State private var criteria2 = 0
    
    @State private var newShots = [Shot]()
    
    var body: some View {

GeometryReader { geometry in
VStack() {
Form {
    
    if(criteria1.key == "Position") {
        Picker(selection: $criteria2, label: Text("Sort By"), content: {
            Text("Type").tag(2)
            Text("Location").tag(3)
        })
    }
    else if(criteria1.key == "Type") {
        Picker(selection: $criteria2, label: Text("Sort By"), content: {
            Text("Position").tag(1)
            Text("Location").tag(3)
        })
    }
    else {
        Picker(selection: $criteria2, label: Text("Sort By"), content: {
            Text("Position").tag(1)
            Text("Type").tag(2)
        })
    }
    
    if(criteria2 == 1) {
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
if(criteria2 == 1 && phase == 1) {
VStack(spacing: 10) {
    
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Text("From 1"),
        label: {
            PositionStatView(num: 1, shotsTaken: one.count)
        })
    
    NavigationLink(
        destination: Text("From 2"),
        label: {
            PositionStatView(num: 2, shotsTaken: two.count)
        })
    
    NavigationLink(
        destination: Text("From 3"),
        label: {
            PositionStatView(num: 3, shotsTaken: three.count)
        })
    
    NavigationLink(
        destination: Text("From 4"),
        label: {
            PositionStatView(num: 4, shotsTaken: four.count)
        })
    
    NavigationLink(
        destination: Text("From 5"),
        label: {
            PositionStatView(num: 5, shotsTaken: five.count)
        })
    
    NavigationLink(
        destination: Text("From Center"),
        label: {
            PositionStatView(num: 6, shotsTaken: six.count)
        })
}//criteria vstack
}//if criteria1
else if(criteria2 == 1 && phase == 2)
{
VStack(spacing: 10) {
    
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Text("From 1"),
        label: {
            PositionStatView(num: 1, shotsTaken: oneUP.count)
        })
    
    NavigationLink(
        destination: Text("From 2"),
        label: {
            PositionStatView(num: 2, shotsTaken: twoUP.count)
        })
    
    NavigationLink(
        destination: Text("From 3"),
        label: {
            PositionStatView(num: 3, shotsTaken: threeUP.count)
        })
    
    NavigationLink(
        destination: Text("From 4"),
        label: {
            PositionStatView(num: 4, shotsTaken: fourUP.count)
        })
    
    NavigationLink(
        destination: Text("From 5"),
        label: {
            PositionStatView(num: 5, shotsTaken: fiveUP.count)
        })
    
    NavigationLink(
        destination: Text("From 6"),
        label: {
            PositionStatView(num: 6, shotsTaken: sixUP.count)
        })
}//criteria vstack
}//else phase 2
    
if(criteria2 == 2) {
VStack(spacing: 10) {
    
    Group {
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Text("Direct"),
        label: {
            TypeStatView(num: 1, shotsTaken: direct.count)
        })
    
    NavigationLink(
        destination: Text("Catch & Shoot"),
        label: {
            TypeStatView(num: 2, shotsTaken: cas.count)
        })
    
    NavigationLink(
        destination: Text("Fake"),
        label: {
            TypeStatView(num: 3, shotsTaken: fake.count)
        })
    
    NavigationLink(
        destination: Text("Drive"),
        label: {
            TypeStatView(num: 4, shotsTaken: drive.count)
        })
    }
    
    NavigationLink(
        destination: Text("Pickup"),
        label: {
            TypeStatView(num: 5, shotsTaken: pickup.count)
        })
    
    NavigationLink(
        destination: Text("Backhand"),
        label: {
            TypeStatView(num: 6, shotsTaken: backhand.count)
        })
    NavigationLink(
        destination: Text("Quick 6v5"),
        label: {
            TypeStatView(num: 7, shotsTaken: quick6v5.count)
        })
    
    NavigationLink(
        destination: Text("Overpass"),
        label: {
            TypeStatView(num: 8, shotsTaken: overpass.count)
        })
    
    NavigationLink(
        destination: Text("Skip"),
        label: {
            TypeStatView(num: 9, shotsTaken: skip.count)
        })
    
    NavigationLink(
        destination: Text("Lob"),
        label: {
            TypeStatView(num: 10, shotsTaken: lob.count)
        })
    
    NavigationLink(
        destination: Text("Transition"),
        label: {
            TypeStatView(num: 11, shotsTaken: transition.count)
        })
}//criteria vstack
}//if criteria1
if(criteria2 == 3) {
VStack(spacing: 10) {
    
    Text("Total Shots: "+String(totalShots))
        
    NavigationLink(
        destination: Text("From 1"),
        label: {
            LocationStatView(num: 1, shotsTaken: oneLoc.count)
        })
    
    NavigationLink(
        destination: Text("From 2"),
        label: {
            LocationStatView(num: 2, shotsTaken: twoLoc.count)
        })
    
    NavigationLink(
        destination: Text("From 3"),
        label: {
            LocationStatView(num: 3, shotsTaken: threeLoc.count)
        })
    
    NavigationLink(
        destination: Text("From 4"),
        label: {
            LocationStatView(num: 4, shotsTaken: fourLoc.count)
        })
    
    NavigationLink(
        destination: Text("From 5"),
        label: {
            LocationStatView(num: 5, shotsTaken: fiveLoc.count)
        })
}//criteria vstack
}//if criteria1

    
    Text("Results")
        .font(.title)
        .padding(.vertical)
    
    //ResultsTable(team: team, criteria1: criteria1, criteria2: nil, criteria3: nil)
}//scrollview
}//vstack
.navigationTitle(team + " Team Stats")
}//geometry
}//body
    
func retrieveCriteria(team: String, criteria: Int) -> Void
{
    let db = Firestore.firestore()
    
    if(criteria == 1) {
    
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
    
    if(criteria == 2) {
    
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
    
    if(criteria == 3) {
    
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
