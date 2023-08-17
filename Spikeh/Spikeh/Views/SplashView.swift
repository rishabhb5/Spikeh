//
//  SplashView.swift
//  SwiftUI_ValBasics
//
//  Created by rishabh on 6/28/23.
//

import SwiftUI

struct SplashView: View {
	
	@State var isActive: Bool = false
	
	var body: some View {
		VStack {
			if self.isActive {
				MainView()
			} else {
				Text("developed by bendi")
					.foregroundColor(.white)
					.fontWeight(.semibold)
			}
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
				withAnimation {
					self.isActive = true
				}
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity) 
		.background(Color.black)
		
	}
}

struct SplashView_Previews: PreviewProvider {
	static var previews: some View {
		SplashView()
	}
}
