//
//  Food_TrackerTests.swift
//  Food TrackerTests
//
//  Created by Juyong Lee on 20/11/2018.
//  Copyright © 2018 Juyong Lee. All rights reserved.
//

import XCTest
@testable import Food_Tracker

class Food_TrackerTests: XCTestCase {

    //  MARK: Meal Class Tests
    //  Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds() {
        //  Zero rating
        let zeroRatingMeal = Meal(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //  Highest positive rating
        let positiveRatingMeal = Meal(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }

    //  Confirm that the Meal initializer return nil when passed a negative rating or an empty name.
    func testMealInitializationFails() {
        //  Negative rating
        let negativeRatingMeal = Meal(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //  Rating exceeds maximum
        let largeRatingMeal = Meal(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        //  Empty String
        let emptyStringMeal = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    
}
