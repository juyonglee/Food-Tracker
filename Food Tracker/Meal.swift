//
//  Meal.swift
//  Food Tracker
//
//  Created by Juyong Lee on 04/12/2018.
//  Copyright © 2018 Juyong Lee. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    //  MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //  MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //  MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        //  The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        //  The raing must be between 0 and 5 inclusively
        guard (rating>=0) && (rating<=5) else {
            return nil
        }
        
        //  Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    //  MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //  The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: OSLogType.debug)
            return nil
        }
        
        //  Because photo is an optional property of Meal, just use conditional case.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        //  Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
    }
    
}
