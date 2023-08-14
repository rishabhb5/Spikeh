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
//			Color.black
//				.ignoresSafeArea()
			
			if self.isActive {
				MainView()
			} else {
				Text("developed by bendi")
					.foregroundColor(.white)
			}
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
				withAnimation {
					print("hi1")
//					valAPI.fetch()
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


//	.onAppear {
//		// have multiple api fetches - (agents, maps)
//		// figure out how to do 1 at a time
//		valAPI.fetch()
//	}
