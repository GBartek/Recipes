//
//  LunchType.swift
//  Recipes
//
//  Created by bartlomiej.guz on 04/08/2019.
//  Copyright © 2019 bartlomiej.guz. All rights reserved.
//

import Foundation

public struct Meal {
    var displayName: String
    var overview: String
    var posterImageName: String
    var categories: [MealCategory]
    var components: [MealComponent]
    var preparation: MealPreparation
    var metadata: MealMetadata
    var tags: [MealTag]
    
    var rawValue: Int
}

public struct MealTag {
    var name: String
    var rawValue: String
}

public struct MealCategory {
    var name: String
    var rawValue: Int
}

public struct MealComponent {
    var measure: String
    var ingredient: MealIngredient
}

public struct MealIngredient {
    var name: String
    var rawValue: Int
}

public struct MealMetadata {
    var duration: TimeInterval
    var difficulity: MealDifficulity
}

public enum MealDifficulity: Int {
    case easy
    case medium
    case hard
}

public struct MealPreparation {
    var steps: [MealPreparationStep]
    var namedImages: [String]
}

public struct MealPreparationStep {
    var title: String
    var description: String
}
