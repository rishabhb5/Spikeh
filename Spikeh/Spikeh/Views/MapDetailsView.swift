//
//  MapDetailsView.swift
//  SwiftUI_ValBasics
//
//  Created by rishabh on 6/29/23.
//

import SwiftUI



struct MapDetailsView: View {
	var mapName: String
	var displayIcon: String
	var coordinates: String
	var mapUrl: String
	
	var body: some View {
		Text(mapName)
			.padding(20)
			.fontWeight(.semibold)
			.font(.system(size: 24))
		
		ScrollView {
			VStack() {
				Text("Coordinates:")
					.fontWeight(.semibold)
				Text(coordinates)
					.padding(.bottom, 20)
					.fontWeight(.semibold)
				
				Text("Map Codename:")
					.fontWeight(.semibold)
				Text(mapUrl)
					.padding(.bottom, 60)
					.fontWeight(.semibold)
				
				Spacer()
				
				// Map Icon
				AsyncImage(url: URL(string: displayIcon), scale: 3)
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: 100, maxHeight: 50)
					.padding(100)
					.frame(maxWidth: UIScreen.main.bounds.width,
										   maxHeight: UIScreen.main.bounds.height)
			}
		}
		
		
	}
}

struct MapDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		MapDetailsView(mapName: "", displayIcon: "", coordinates: "", mapUrl: "")
	}
}
