//
//  LandMarkList.swift
//  Landmarks
//
//  Created by Alejandro Hernandez on 24/02/24.
//

import SwiftUI

struct LandMarkList: View {
    @State private var showFavoritesOnly: Bool = false
    @Environment(ModelData.self) var modelData
    
    var filteredLandmark: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmark) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmark)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandMarkList()
        .environment(ModelData())
}
