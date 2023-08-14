//
//  MapsAPIHandler.swift
//  SwiftUI_ValBasics
//
//  Created by rishabh on 6/27/23.
//

import Foundation
import SwiftUI

struct MapsResponse: Hashable, Codable {
	let data: [MapData]
}
//
struct MapData: Hashable, Codable {
	let displayName: String
	let coordinates: String?
	let displayIcon: String?
	let listViewIcon: String
	let splash: String
}

class MapsAPIHandler: ObservableObject {
	
	@Published var mapsDataDict: [String: MapData] = [:]
	
	func mapsFetch() {
		print("maps fetch")
		guard let url = URL(string: "https://valorant-api.com/v1/maps")
		else {
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
			guard let data = data, error == nil else {
				return
			}
			
			do {
				let root = try JSONDecoder().decode(MapsResponse.self, from: data)
				
				let mapData = root.data
				
				DispatchQueue.main.async {
					for map in mapData {
//						print(weapon)
						if (map.displayName != "The Range") {
							self?.mapsDataDict[map.displayName] = map
						}
						
					}
				}
			} catch {
				print("error")
			}
		}
		task.resume()
		
//		var range = "The Range"
//		mapsDataDict[range] = nil
		
		
	}
	
}
