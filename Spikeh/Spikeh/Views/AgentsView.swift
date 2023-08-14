// Created 20230624
// AgentsView.swift

import SwiftUI

struct AgentsView: View {
	
	@StateObject private var agentAPI = AgentsAPIHandler()
	@State var isActive: Bool = false
	
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		//			HStack {
		//				Image("Spikeh_Icon")
		//					.resizable()
		//					.scaledToFit()
		//					.frame(width: 50, height: 50)
		//
		//
		//
		//				Text("Spikeh")
		//					.fontWeight(.bold)
		//			}
		
		
		NavigationStack() {
			List {
				let agentKeys: [String] = Array(agentAPI.agentDataDict.keys)
				let sortedAgentKeys = agentKeys.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
				
				
				ForEach(sortedAgentKeys, id: \.self) { key in
					HStack {
						// data to load into UI
						let agentName: String = agentAPI.agentDataDict[key]!.displayName
						let agentDescription: String = agentAPI.agentDataDict[key]!.description
						let agentIcon: String = agentAPI.agentDataDict[key]!.displayIcon
						let agentBust: String = agentAPI.agentDataDict[key]!.bustPortrait!
						let agentBackground: String = agentAPI.agentDataDict[key]!.background!
						
						//							Text(agentBust)
						//
						// Agent Icon
						AsyncImage(url: URL(string: agentIcon), scale: 4)
							.aspectRatio(contentMode: .fit)
							.frame(maxWidth: 50, maxHeight: 50)
						//								.clipShape(RoundedRectangle(cornerRadius: 10))
						//								.border(.black, width: 4)
						//								.overlay(
						//									Rectangle()
						//										.stroke(Color.black, lineWidth: 4)
						//								)
							.padding(4)
							.cornerRadius(5) // Inner corner radius
							.padding(1) // Width of the border
							.background(Color.black) // Color of the border
						//								.cornerRadius(3) // Outer corner radius
						//								.cornerRadius(0)
						
						// Agent Name + Link
						NavigationLink(destination: AgentDetailsView(agentName: agentName, agentDescription: agentDescription, agentBust: agentBust, agentBackground: agentBackground)) {
							Text(agentName)
							//									.bold()
								.fontWeight(.semibold)
							//									.foregroundColor(.white)
								.padding(15)
						}
					}
					.padding(1)
					//						.listRowBackground(Color(.gray))
					
				}
			}
			//			.navigationTitle("Agents")
			//			.listStyle(PlainListStyle())
			//			.frame(height:UIScreen.main.bounds.height - 80)
			//			.background(.black)
			//			.scrollContentBackground(.hidden)
			//			.opacity(50)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Text("Agents")
						.font(.title2)
						.fontWeight(.semibold)
					//							.padding(.top, 20)
						.foregroundColor(.white)
				}
				
			}
			//			.toolbarBackground(.black)
			.onAppear {
				// have multiple api fetches - (agents, maps)
				// figure out how to do 1 at a time
				if self.isActive {
					// do nothing
				} else {
					print("fetching Agents")
					agentAPI.agentsFetch()
					//					valAPI.weaponsFetch()
					isActive = true
				}
				
			}
			.navigationBarTitleDisplayMode(.inline) // to change style
		}
	}
	
	//        .padding(3)
}

struct AgentsView_Previews: PreviewProvider {
	static var previews: some View {
		AgentsView()
	}
}

//func viewForAgent(_ agent: String) -> AnyView {
//	switch agent {
//	case "Astra":
//		return AnyView(Color(.systemPurple))
//	case "Gekko":
//		return AnyView(Color(.green))
//	case "Neon":
//		return AnyView(Color(.systemBlue))
//	default:
//		return AnyView(Color(.systemRed))
//	}
//
//}

//func agentOrder(_ agentNumber: Int) -> String {
//	switch agentNumber {
//	case 1:
//		return "Gekko"
//	case 2:
//		return "Fade"
//	case 3:
//		return "Breach"
//	case 4:
//		return "Raze"
//	case 5:
//		return "Chamber"
//	case 6:
//		return "KAY/O"
//	case 7:
//		return "Skye"
//	case 8:
//		return "Cypher"
//	case 9:
//		return "Sova"
//	case 10:
//		return "Killjoy"
//	case 11:
//		return "Harbor"
//	case 12:
//		return "Viper"
//	case 13:
//		return "Phoenix"
//	case 14:
//		return "Astra"
//	case 15:
//		return "Brimstone"
//	case 16:
//		return "Neon"
//	case 17:
//		return "Yoru"
//	case 18:
//		return "Sage"
//	case 19:
//		return "Reyna"
//	case 20:
//		return "Omen"
//	case 21:
//		return "Jett"
//	default:
//		return "None"
//	}
//}

//func agentName(_ agentName: String) -> String {
//	for index in 1...21 {
//		print(index)
//	}
//}

// Array Approach (doing HashMap Approach)
//				ForEach(valAPI.agentList, id: \.self) { agent in
//					HStack {
//						Text(agent.displayName)
//							.bold()
//						NavigationLink(value: agent.displayName) {
//							Text(agent.displayName)
//						}
//					}
//					.padding(3)
//				}

// Doesn't work within View
//				for index in 1...21 {
//					let agentName = agentOrder(index)
//					print(agentName)
//				}
