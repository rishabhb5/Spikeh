//
//  WeaponsView.swift
//  SwiftUI_ValBasics
//
//  Created by rishabh on 6/28/23.
//

import SwiftUI

struct WeaponsView: View {
	
	@StateObject private var valWeaponsAPI = WeaponsAPIHandler()
	@State var isActive: Bool = false
	
	var body: some View {
		NavigationStack {
			List {
				let weaponKeys: [String] = Array(valWeaponsAPI.weaponsDataDict.keys)
				let sortedWeaponKeys = weaponKeys.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
				
				ForEach(sortedWeaponKeys, id: \.self) { key in
					HStack {
						// Data
						let weaponName: String = valWeaponsAPI.weaponsDataDict[key]!.displayName
						let weaponIcon: String = valWeaponsAPI.weaponsDataDict[key]!.displayIcon
						
						Text(weaponName)
							.fontWeight(.semibold)
						
						Spacer()
						
						// Weapon Icon
						// Some of these assets from the API have larger images than the rest by default
						if (weaponName == "Classic" || weaponName == "Frenzy") {
							// Weapon Icon
							AsyncImage(url: URL(string: weaponIcon), scale: 7)
								.aspectRatio(contentMode: .fit)
								.frame(maxWidth: 50, maxHeight: 50)
								.padding(25)
								.frame(maxWidth: UIScreen.main.bounds.width,
									   maxHeight: UIScreen.main.bounds.height)
						}
						else if (weaponName == "Ghost" || weaponName == "Melee" || weaponName == "Sheriff") {
							AsyncImage(url: URL(string: weaponIcon), scale: 5.5)
								.aspectRatio(contentMode: .fit)
								.frame(maxWidth: 50, maxHeight: 50)
								.padding(25)
								.frame(maxWidth: UIScreen.main.bounds.width,
									   maxHeight: UIScreen.main.bounds.height)
						}
						else if (weaponName == "Shorty") {
							AsyncImage(url: URL(string: weaponIcon), scale: 5)
								.aspectRatio(contentMode: .fit)
								.frame(maxWidth: 50, maxHeight: 50)
								.padding(25)
								.frame(maxWidth: UIScreen.main.bounds.width,
									   maxHeight: UIScreen.main.bounds.height)
						}
						else {
							// Weapon Icon
							AsyncImage(url: URL(string: weaponIcon), scale: 3)
								.aspectRatio(contentMode: .fit)
								.frame(maxWidth: 150, maxHeight: 150)
								.padding(25)
								.frame(maxWidth: UIScreen.main.bounds.width,
									   maxHeight: UIScreen.main.bounds.height)
						}
					}	//*HStack*//
				}	//*ForEach*//
			}	//*List*//
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Text("Equipment")
						.font(.title2)
						.fontWeight(.semibold)
						.foregroundColor(.white)
				}
				
			}
		}
		.onAppear {
			if self.isActive {
				// do nothing
			} else {
				print("fetching weapons")
				valWeaponsAPI.weaponsFetch()
				isActive = true
			}
		}
	}
}

struct WeaponsView_Previews: PreviewProvider {
	static var previews: some View {
		WeaponsView()
	}
}
