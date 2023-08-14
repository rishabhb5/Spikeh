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
			Spacer()
			Divider()
			
			AsyncImage(url: URL(string: agentBackground), scale: 1.8)
				.opacity(0.5)
				.overlay {
					AsyncImage(url: URL(string: agentBust), scale: 4.5)
						.aspectRatio(contentMode: .fit)
						.frame(maxWidth: 500, maxHeight: 500)
						.padding(4)
						.cornerRadius(5) // Inner corner radius
						.padding(1) // Width of the border
//						.background(Color.black) // Color of the border
				}
			
			
			
//			AsyncImage(url: URL(string: agentBust), scale: 4.5)
//				.aspectRatio(contentMode: .fit)
//				.frame(maxWidth: 500, maxHeight: 500)
//				.padding(4)
//				.cornerRadius(5) // Inner corner radius
//				.padding(1) // Width of the border
//				.background(Color.black) // Color of the border
//				.overlay {
//					AsyncImage(url: URL(string: agentBackground))
//						.opacity(0.7)
//						.frame(maxWidth: 500, maxHeight: 500)
//				}
			
			//			.frame(maxWidth: 50, maxHeight: 50)
			//
				
//			Divider()
//			Spacer()
			
			Text(agentDescription)
				.frame(width: 350)
				.fontWeight(.semibold)
				.font(.system(size: 16))
				.padding(5)
//				.overlay(
//						RoundedRectangle(cornerRadius: 16)
//							.stroke(.white, lineWidth: 1)
//					)
//				.border(.white)
			
		}
//		.navigationBarBackButtonHidden(true)
//		.toolbar {
//			ToolbarItem(placement: .navigationBarLeading) {
//				Button {
//					dismiss()
//				} label: {
//					HStack {
//						Image(systemName: "chevron.backward")
//							.foregroundColor(.white)
//						Text("Back")
//							.foregroundColor(.white)
//					}
//				}
//			}
//		}
	}
}

struct AgentDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		AgentDetailsView(agentName: "", agentDescription: "", agentBust: "", agentBackground: "")
	}
}
