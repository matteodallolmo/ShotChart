//
//  ContentView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    
    var admin: Bool
    
    var body: some View {
        
    if(admin)
    {
        AdminView()
    }
    else
    {
        ViewerView()
    }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(admin: true)
    }
}
