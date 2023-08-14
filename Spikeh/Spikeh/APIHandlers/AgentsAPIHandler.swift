// Created 20230624
// APIHandler.swift

import Foundation
import SwiftUI

// STRUCTS

// Agent Struct
// the structs match JSON structure. AgentsResponse is the root.
// add more fields as more information needs to be added
struct AgentsResponse: Hashable, Codable {
	let data: [AgentData]
}
//
struct AgentData: Hashable, Codable {
	let uuid: String
	let displayName: String
	let description: String
	let displayIcon: String
	let bustPortrait: String?
	let isPlayableCharacter: Bool
	let background: String?
}


// API HANDLER
// fetches JSON from valorant-api.com, using Codable: decodes and parses it, and saves it to a dictionary
class AgentsAPIHandler: ObservableObject {
	// Dictionary of type AgentData (key: displayName, value: AgentData)
	@Published var agentDataDict: [String : AgentData] = [:]
	
	// AGENTS FETCH
	func agentsFetch() {
		print("agents fetch")
		guard let url = URL(string: "https://valorant-api.com/v1/agents") else {
			return
		}
		
		// getting data from API and storing it into 'data'
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
			guard let data = data, error == nil else {
				return
			}

			// Decode the JSON response
			do {
				// decode has to decode from root (AgentsResponse)
				// matches the struct structure to structure of the JSON 'data'
				let root = try JSONDecoder().decode(AgentsResponse.self, from: data)
				let agentData = root.data
				
				// For Debugging
				// print(agentData)
				// print(agentData[3].displayName)
				 //print(agentData[3].bustPortrait!)
//				print(agentData[3].fullPortrait)
				
				DispatchQueue.main.async {
					for agent in agentData {
						// check bc there are 2 Sovas in the response data (only 1 is playable)
						if (agent.isPlayableCharacter == true) {
							// add agent data to agentDataDict
							self?.agentDataDict[agent.displayName] = agent
							
							// For Debugging
							//print(self?.agentMap.keys)
						}
						
					}
				}
			} catch {
				print("error")
			}
		}
		task.resume()
	}
}


// Array Implementation of agentList (went with Dictionary Implementation)
// array of type AgentData (every index is a different agent)
//	@Published var agentList: [AgentData] = []
