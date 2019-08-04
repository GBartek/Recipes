//
//  HomeViewModel.swift
//  Recipes
//
//  Created by bartlomiej.guz on 04/08/2019.
//  Copyright © 2019 bartlomiej.guz. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeViewModelDef {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

protocol HomeViewModelInputs {
    func viewWillAppear()
}

protocol HomeViewModelOutputs {
    var items: Observable<[HomeMealItem]> { get }
    var errors: Observable<String> { get }
}

struct HomeViewModel: HomeViewModelDef, HomeViewModelInputs, HomeViewModelOutputs {
    func viewWillAppear() {
        viewWillAppearSubject.onNext(())
    }
    
    var inputs: HomeViewModelInputs { return self }
    var outputs: HomeViewModelOutputs { return self }
    
    init(provider: HomeMealItemsProviding) {
        let result = viewWillAppearSubject.flatMapLatest { _ in
            provider.fetchListOfHomeMeals()
        }
        .materialize()
        .share()
        
        // Are `.elements()` and `.errors` gone??
        items = result.map { $0.element }.flatMap { Observable.from(optional: $0) }
        errors = result.map { $0.error?.localizedDescription }.flatMap { Observable.from(optional: $0) }
    }
    
    let items: Observable<[HomeMealItem]>
    let errors: Observable<String>
    
    private let viewWillAppearSubject = PublishSubject<Void>()
}
