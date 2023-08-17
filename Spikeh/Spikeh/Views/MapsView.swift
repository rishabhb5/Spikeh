// Created 20230625
// MapsView.swift

import SwiftUI

struct MapsView: View {
	
	@StateObject private var mapAPI = MapsAPIHandler()
	@State var isActive: Bool = false
	
	var body: some View {
		NavigationStack() {
			List {
				let mapKeys: [String] = Array(mapAPI.mapsDataDict.keys)
				let sortedMapKeys = mapKeys.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
			
				ForEach(sortedMapKeys, id: \.self) { key in
					HStack {
						let mapName: String = mapAPI.mapsDataDict[key]!.displayName
						let coordinates: String = mapAPI.mapsDataDict[key]!.coordinates ?? "No Coordinates Found"
						let displayIcon: String =  mapAPI.mapsDataDict[key]!.displayIcon ?? "nil"
						let listViewIcon: String = mapAPI.mapsDataDict[key]!.listViewIcon
						let mapUrl: String = mapAPI.mapsDataDict[key]!.mapUrl ?? "No Codename Found"
						
						AsyncImage(url: URL(string: listViewIcon), scale: 3)
							.aspectRatio(contentMode: .fit)
							.frame(maxWidth: 200, maxHeight: 200)
							.padding()
						
						NavigationLink(destination: MapDetailsView(mapName: mapName, displayIcon: displayIcon, coordinates: coordinates, mapUrl: mapUrl)) {
							Text(mapName)
								.fontWeight(.semibold)
								.padding(10)
						}
					}
				}
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
						Text("Maps")
						.font(.title2)
							.fontWeight(.semibold)
							.foregroundColor(.white)
				}
			}
			.onAppear {
				if self.isActive {
					// do nothing
				} else {
					print("fetching Maps")
					mapAPI.mapsFetch()
					isActive = true
				}
				
			}
			.navigationBarTitleDisplayMode(.inline) // to change style
		}
	}
}

struct MapsView_Previews: PreviewProvider {
	static var previews: some View {
		MapsView()
	}
}
