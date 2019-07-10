//
//  ContentView.swift
//  DoubleClickHapticTest
//
//  Created by PBB on 2019/7/10.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI
//import CoreHaptics

struct ContentView : View {
    @State var isLockscreen = false
    private var hapticsPlayer = HapticsPlayer()
    
    var body: some View {
        let doubleTapGesture = TapGesture(count: 2)
            .onEnded { _ in
                self.isLockscreen.toggle()
//                if self.isLockscreen{
                self.hapticsPlayer.playFeedbackGenerator()
//                }
        }
        
        
        return ZStack {
            Color.black
            if isLockscreen {
                Image("lockscreen")
                    .scaledToFit()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .gesture(doubleTapGesture)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
