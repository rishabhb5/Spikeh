// Created 20230625
// MainView.swift

import SwiftUI

struct MainView: View {
//	@StateObject private var valAPI1 = APIHandler()
	
	var body: some View {
		
		VStack {
//			Image("Valorant-Emblem")
//				.resizable()
//				.scaledToFit()
//				.aspectRatio(contentMode: .fit)
//			.frame(width: 150, height: 75, alignment: .center)
			
			TabView {
				AgentsView()
					.tabItem {
						Label("Agents", systemImage: "person")
					}
//					.preferredColorScheme(.dark)
				WeaponsView()
					.tabItem {
						Label("Equipment", systemImage: "scope")
					}
//					.preferredColorScheme(.dark)
				MapsView()
					.tabItem {
						Label("Maps", systemImage: "map")
					}
//					.preferredColorScheme(.dark)
				
			}
			.accentColor(.red)
			.preferredColorScheme(.dark)
		}

//		.onAppear {
//			// have multiple api fetches - (agents, maps)
//			// figure out how to do 1 at a time
//			valAPI1.fetch()
//		}
//		.padding(3)
	}
	
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
