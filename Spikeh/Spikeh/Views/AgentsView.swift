// Created 20230624
// AgentsView.swift

import SwiftUI

struct AgentsView: View {
	
	@StateObject private var agentAPI = AgentsAPIHandler()
	@State var isActive: Bool = false
		
	var body: some View {
		NavigationStack() {
			List {
				let agentKeys: [String] = Array(agentAPI.agentDataDict.keys)
				let sortedAgentKeys = agentKeys.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
				
				ForEach(sortedAgentKeys, id: \.self) { key in
					HStack {
						// Data
						let agentName: String = agentAPI.agentDataDict[key]!.displayName
						let agentDescription: String = agentAPI.agentDataDict[key]!.description
						let agentIcon: String = agentAPI.agentDataDict[key]!.displayIcon
						let agentBust: String = agentAPI.agentDataDict[key]!.bustPortrait!
						let agentBackground: String = agentAPI.agentDataDict[key]!.background!
						
						// Agent Icon
						AsyncImage(url: URL(string: agentIcon), scale: 4)
							.aspectRatio(contentMode: .fit)
							.frame(maxWidth: 50, maxHeight: 50)
							.padding(4)
							.cornerRadius(5) // Inner corner radius
							.padding(1) // Width of the border
							.background(Color.black) // Color of the border
						
						// Agent Name + Link
						NavigationLink(destination: AgentDetailsView(agentName: agentName, agentDescription: agentDescription, agentBust: agentBust, agentBackground: agentBackground)) {
							Text(agentName)
								.fontWeight(.semibold)
								.padding(15)
						}
					}//*HStack*//
					.padding(1)
				}//*ForEach*//
			}//*List*//
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Text("Agents")
						.font(.title2)
						.fontWeight(.semibold)
						.foregroundColor(.white)
				}
				
			}
			.onAppear {
				if self.isActive {
					// do nothing
				} else {
					print("fetching Agents")
					agentAPI.agentsFetch()
					isActive = true
				}
				
			}
			.navigationBarTitleDisplayMode(.inline) // to change style
		}//*NavigationStack*//
	}
}

struct AgentsView_Previews: PreviewProvider {
	static var previews: some View {
		AgentsView()
	}
}
