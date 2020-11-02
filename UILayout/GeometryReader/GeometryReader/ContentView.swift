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

struct ExampleView: View {
    @State private var width: CGFloat = 50
    
    var body: some View {
        VStack {
            SubView()
                .frame(width: self.width, height: 120)
                .border(Color.blue, width: 2)
            
            Text("Offered Width \(Int(width))")
            Slider(value: $width, in: 0...200, step: 1)
        }
    }
}


struct SubView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.yellow.opacity(0.7))
                .frame(width: max(proxy.size.width, 120), height: max(proxy.size.height, 120))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
