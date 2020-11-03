//
//  ContentView.swift
//  Properties
//
//  Created by 熊熙 on 2020/11/3.
//

import SwiftUI

struct DialView: View {
    @State private var activeNumber: Int = 1
    @State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 9)

    var body: some View {
        ZStack(alignment: .topLeading) {
            Circle()
                .stroke(Color.green, lineWidth: 5)
                .frame(width: rects[activeNumber - 1].width, height: rects[activeNumber - 1].height)
                .offset(x: rects[activeNumber - 1].minX, y: rects[activeNumber - 1].minY)
                .animation(.easeInOut)
            
            VStack {
                Spacer()
                HStack {
                    NumberView(activeNumber: $activeNumber, number: 1)
                    NumberView(activeNumber: $activeNumber, number: 2)
                    NumberView(activeNumber: $activeNumber, number: 3)
                }
                HStack {
                    NumberView(activeNumber: $activeNumber, number: 4)
                    NumberView(activeNumber: $activeNumber, number: 5)
                    NumberView(activeNumber: $activeNumber, number: 6)
                }
                HStack {
                    NumberView(activeNumber: $activeNumber, number: 7)
                    NumberView(activeNumber: $activeNumber, number: 8)
                    NumberView(activeNumber: $activeNumber, number: 9)
                }
                Spacer()
            }
        }
        .onPreferenceChange(NumberPreferenceKey.self) { preferences in
            for pre in preferences {
                //存储指定idx视图的rect
                self.rects[pre.viewIdx] = pre.rect
            }
        }
        .coordinateSpace(name: "ZStackSpace")
        
    }

    struct NumberView: View {
        @Binding var activeNumber: Int
        let number: Int

        var body: some View {
            Text("\(number)")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .padding(20)
                .background(NumberPreferenceViewSetter(idx: number - 1))
                .onTapGesture {
                    self.activeNumber = number
                }
        }
    }

    struct NumberPreferenceViewSetter: View {
        let idx: Int
        var body: some View {
            GeometryReader { proxy in
                Circle()
                    .stroke(Color.clear, lineWidth: 5)
                    .preference(key: NumberPreferenceKey.self, value: [NumberPreferenceValue(viewIdx: idx, rect: proxy.frame(in: .named("ZStackSpace")))])
            }
        }
    }
    
    struct NumberPreferenceValue: Equatable {
        let viewIdx: Int
        let rect: CGRect
    }
    
    struct NumberPreferenceKey: PreferenceKey {
        typealias Value = [NumberPreferenceValue]
        
        static var defaultValue: [NumberPreferenceValue] = []
        
        static func reduce(value: inout [NumberPreferenceValue], nextValue: () -> [NumberPreferenceValue]) {
            value.append(contentsOf: nextValue())
        }
    }
}

struct ContentView: View {
    var body: some View {
        DialView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
