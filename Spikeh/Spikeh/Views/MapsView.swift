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
//						let mapCoordinates: String = mapAPI.mapsDataDict[key]!.coordinates!
						let displayIcon: String =  mapAPI.mapsDataDict[key]!.displayIcon ?? "nil"
						let listViewIcon: String = mapAPI.mapsDataDict[key]!.listViewIcon
						let splash: String = mapAPI.mapsDataDict[key]!.splash
						
						AsyncImage(url: URL(string: listViewIcon), scale: 3)
							.aspectRatio(contentMode: .fit)
							.frame(maxWidth: 200, maxHeight: 200)
							.padding()
						
						NavigationLink(destination: MapDetailsView(mapName: mapName, displayIcon: displayIcon, splash: splash)) {
							Text(mapName)
								.fontWeight(.semibold)
						}
						//
					}
				}
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
						Text("Maps")
						.font(.title2)
							.fontWeight(.semibold)
//							.padding(.top, 20)
							.foregroundColor(.white)
				}
				
			}
//			.navigationTitle("Maps")
			.onAppear {
				// have multiple api fetches - (agents, maps)
				// figure out how to do 1 at a time
				if self.isActive {
					// do nothing
				} else {
					print("fetching Maps")
					mapAPI.mapsFetch()
//					valAPI.weaponsFetch()
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
