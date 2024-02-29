//
//  ContentView.swift
//  Landmarks
//
//  Created by Alejandro Hernandez on 23/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandMarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
