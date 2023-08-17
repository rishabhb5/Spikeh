// Created 20230625
// AgentDetailsView.swift

import SwiftUI

struct AgentDetailsView: View {
	var agentName: String
	var agentDescription: String
	var agentBust: String
	var agentBackground: String
	
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		ScrollView {
			Text(agentName)
				.fontWeight(.bold)
			
			Divider()
			
			AsyncImage(url: URL(string: agentBackground), scale: 1.8)
				.opacity(0.5)
				.overlay {
					AsyncImage(url: URL(string: agentBust), scale: 4.5)
						.aspectRatio(contentMode: .fit)
						.frame(maxWidth: 500, maxHeight: 200)
				}
			
			Text("Agent Bio:")
				.fontWeight(.semibold)
			
			Text(agentDescription)
				.frame(width: 350)
				.fontWeight(.semibold)
				.font(.system(size: 16))
		}
	}
}

struct AgentDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		AgentDetailsView(agentName: "", agentDescription: "", agentBust: "", agentBackground: "")
	}
}
