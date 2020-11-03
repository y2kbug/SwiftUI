//
//  ContentView.swift
//  Animation
//
//  Created by 熊熙 on 2020/11/3.
//

import SwiftUI

struct ContentView: View {
    @State private var half = false
    @State private var dim = false
    
    var body: some View {
        Image("UnitType")
            .resizable()
            .scaleEffect(half ? 0.5: 1.0)
            .opacity(dim ? 0.2 : 1.0)
            .animation(.easeInOut(duration: 1.0))
            .onTapGesture(perform: {
                self.half.toggle()
                //self.dim.toggle()
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.dim.toggle()
                }
                //self.half.toggle()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
