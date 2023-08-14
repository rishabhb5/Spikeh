//
//  WeaponsAPIHandler.swift
//  SwiftUI_ValBasics
//
//  Created by rishabh on 6/28/23.
//

import Foundation
import SwiftUI

// Weapon Struct
struct WeaponsResponse: Hashable, Codable {
	let data: [WeaponData]
}
//
struct WeaponData: Hashable, Codable {
	let displayName: String
	let displayIcon: String
}

class WeaponsAPIHandler: ObservableObject {
	
	@Published var weaponsDataDict: [String : WeaponData] = [:]
	
	func weaponsFetch() {
		print("weapons fetch")
		guard let url = URL(string: "https://valorant-api.com/v1/weapons")
		else {
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
			guard let data = data, error == nil else {
				return
			}
			
			do {
				let root = try JSONDecoder().decode(WeaponsResponse.self, from: data)
				
				let weaponData = root.data
				
				DispatchQueue.main.async {
					for weapon in weaponData {
//						print(weapon)
						self?.weaponsDataDict[weapon.displayName] = weapon
					}
				}
			} catch {
				print("error")
			}
		}
		task.resume()
		
	}
}
