//
//  HomeMealItemsProviding.swift
//  Recipes
//
//  Created by bartlomiej.guz on 04/08/2019.
//  Copyright © 2019 bartlomiej.guz. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeMealItem {
    var title: String { get }
    var overview: String { get }
    var imageName: String { get }
}

protocol HomeMealItemsProviding {
    func fetchListOfHomeMeals() -> Observable<[HomeMealItem]>
}
