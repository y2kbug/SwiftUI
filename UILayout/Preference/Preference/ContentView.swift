//
//  ContentView.swift
//  Preference
//
//  Created by 熊熙 on 2020/11/2.
//

import SwiftUI

struct NumberPreferenceValue: Equatable {
    let viewIdx: Int
    let rect: CGRect
}

struct NumberPreferenceKey: PreferenceKey {
    typealias value = [NumberPreferenceValue]
    static var defaultValue: [NumberPreferenceValue] = []
    static func reduce(value: inout [NumberPreferenceValue], nextValue: () -> [NumberPreferenceValue]) {
        value.append(contentsOf: nextValue())
    }
}


struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(width: 200, height: 100)
            .background(Color.green)
            .frame(width: 400, height: 200)
            .background(Color.orange.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
