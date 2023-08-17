// Created 20230625
// MainView.swift

import SwiftUI

struct MainView: View {
//	@StateObject private var valAPI1 = APIHandler()
	
	var body: some View {
		
		VStack {
			TabView {
				AgentsView()
					.tabItem {
						Label("Agents", systemImage: "person")
					}
				WeaponsView()
					.tabItem {
						Label("Equipment", systemImage: "scope")
					}
				MapsView()
					.tabItem {
						Label("Maps", systemImage: "map")
					}
			}//*TabView*//
			.accentColor(.red)
			.preferredColorScheme(.dark)
		}//*VStack*//
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
