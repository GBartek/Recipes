//
//  DummyHomeMealItemProvider.swift
//  Recipes
//
//  Created by bartlomiej.guz on 04/08/2019.
//  Copyright © 2019 bartlomiej.guz. All rights reserved.
//

import Foundation
import RxSwift

struct HomeMealItemData: HomeMealItem {
    var title: String
    var overview: String
    var imageName: String
}

struct DummyHomeMealItemsProvider: HomeMealItemsProviding {
    func fetchListOfHomeMeals() -> Observable<[HomeMealItem]> {
        return .deferred {
            let item1 = HomeMealItemData(title: "MINI PIZZE Z CUKINII",
                                         overview: "Zapiekane plastry cukinii z sosem pomidorowym, serem i salami",
                                         imageName: "")
            let item2 = HomeMealItemData(title: "CIASTO MAŚLANKOWE Z OWOCAMI I KRUSZONKĄ",
                                         overview: "Puszyste ciasto maślankowe z malinami oraz borówką amerykańską",
                                         imageName: "")
            let item3 = HomeMealItemData(title: "OWSIANKA Z OWOCAMI I JOGURTEM",
                                         overview: "Owsianka bez gotowania",
                                         imageName: "")
            
            let initial = Observable<[HomeMealItem]>.just([item1, item2])
            let delayed = Observable<[HomeMealItem]>.just([item1, item2, item3]).delay(3, scheduler: MainScheduler())
            
            return Observable.of(initial, delayed).merge()
        }
    }
}
