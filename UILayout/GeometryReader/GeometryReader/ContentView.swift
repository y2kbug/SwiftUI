//
//  ContentView.swift
//  GeometryReader
//
//  Created by 熊熙 on 2020/11/2.
//

import SwiftUI

struct ContentView: View {
    @State private var w: CGFloat = 100
    @State private var h: CGFloat = 100
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(width: w, height: h)
                .background(Color.green)
            Slider(value: self.$w, in: 10...300)
                .padding(.horizontal, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
