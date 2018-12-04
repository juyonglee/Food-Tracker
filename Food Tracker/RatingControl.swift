//
//  RatingControl.swift
//  Food Tracker
//
//  Created by Juyong Lee on 02/12/2018.
//  Copyright © 2018 Juyong Lee. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //  MARK: Properties
    @IBInspectable var startSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setupButtons()
        }
    }
    
    @IBInspectable var startCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    private var ratingButton = [UIButton]()
    var rating = 0 {
        didSet {
            updataButtonSelectionStates()
        }
    }
    
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
        guard let index = ratingButton.firstIndex(of: button) else {
            fatalError("The button \(button), is not in the ratingButtons array: \(ratingButton)")
        }
        
        //  Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            //  If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    //  MARK: Private Methods
    private func updataButtonSelectionStates() {
        for (index, button) in ratingButton.enumerated() {
            //  If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating ? true : false
        }
    }
    
    private func setupButtons() {
        //  Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        //  Clear any existing buttons
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButton.removeAll()
        
        for index in 0..<startCount {
            //  Create the button
            let button = UIButton()
            
            //  Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            //  Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            
            //  Set the accessibility label
            button.accessibilityLabel = "Set \(index+1) star rating"
            
            //  Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            //  Add the button to the stack
            addArrangedSubview(button)
            
            //  Add the new button to the rating button array
            ratingButton.append(button)
        }
        
        updataButtonSelectionStates()
    }
    
}
