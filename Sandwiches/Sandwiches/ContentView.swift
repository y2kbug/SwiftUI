//
//  ContentView.swift
//  Sandwiches
//
//  Created by 熊熙 on 2020/10/10.
//

import SwiftUI
import URLImage

struct ContentView: View {
    let url = URL(
        string: "https://pic.to8to.com/case/2003/16/20200316_b338fcfd406caaa67e2dp60osluajjbd.jpg"
    )
    var body: some View {
        Text("Hello")
        URLImage(url: url! ,
                 content: { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 })
        }
}
    /*
    var body: some View {
        
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("My sanwich")
                Text("3 ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
