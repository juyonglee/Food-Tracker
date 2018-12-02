//
//  RatingControl.swift
//  Food Tracker
//
//  Created by Juyong Lee on 02/12/2018.
//  Copyright © 2018 Juyong Lee. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //  MARK: Properties
    private var ratingButton = [UIButton]()
    var rating = 0
    
    //  MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    //  required 수식어를 Class Initializer 앞에 정의하여 해당 Class의 모든 Class는 Initializer를 구현해야 한다고 표시한다.
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //  MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button preessed 👍")
    }
    
    //  MARK: Private Methods
    private func setupButtons() {
        for _ in 0..<5 {
            //  Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //  Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            //  Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            //  Add the button to the stack
            addArrangedSubview(button)
            
            //  Add the new button to the rating button array
            ratingButton.append(button)
        }
        
    }
}
