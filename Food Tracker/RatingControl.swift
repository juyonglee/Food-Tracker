//
//  RatingControl.swift
//  Food Tracker
//
//  Created by Juyong Lee on 02/12/2018.
//  Copyright © 2018 Juyong Lee. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //  MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //  required 수식어를 Class Initializer 앞에 정의하여 해당 Class의 모든 Class는 Initializer를 구현해야 한다고 표시한다.
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
