//
//  CaffeineWidgetView.swift
//  CoffeineWidgetExtension
//
//  Created by 熊熙 on 2020/10/9.
//

import SwiftUI
import WidgetKit
import URLImage

struct CaffeineWidgetData {
    /// 咖啡因数量
    let caffineAmount: Measurement<UnitMass>
    /// 饮料名称
    let drinkName: String
    /// 饮用日期
    let drinkDate: Date
}

extension CaffeineWidgetData {
    static let previewData = CaffeineWidgetData(
        caffineAmount: Measurement<UnitMass>(value: 56.23, unit: .milligrams),
        drinkName: "Cappuccino",
        drinkDate: Date().advanced(by: (-60*29+5)))
}

struct CaffeineWidgetView: View {
    
    let data: CaffeineWidgetData
    let measurementFormatter = MeasurementFormatter()
    
    let url = URL(
        string: "https://pic.to8to.com/case/2003/16/20200316_b338fcfd406caaa67e2dp60osluajjbd.jpg"
    )
    var body: some View {
        URLImage(url: url!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CaffeineWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CaffeineWidgetView(data: .previewData)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}


//VStack(alignment: .leading){
//    Text("Caffeine")
//        .font(.body)
//        .foregroundColor(Color.green)
//        .bold()
//
//    Text(MeasurementFormatter().string(from: data.caffineAmount))
//        .font(.title)
//        .bold()
//        .foregroundColor(Color.blue)
//        .minimumScaleFactor(0.8)
