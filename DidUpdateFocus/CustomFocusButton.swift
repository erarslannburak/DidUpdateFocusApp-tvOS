//
//  CustomFocusButton.swift
//  DidUpdateFocus
//
//  Created by Burak Erarslan on 16.05.2021.
//

import UIKit

class CustomFocusButton: UIButton {

    @IBInspectable var scaleX: CGFloat = 1.0
    @IBInspectable var scaleY: CGFloat = 1.0
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable var dafaultButtonTitleColor: UIColor = UIColor.white {
        didSet {
            setTitleColor(dafaultButtonTitleColor, for: .normal)
        }
    }
    @IBInspectable var dafaultBackgroundColor: UIColor = UIColor.clear {
        didSet {
            backgroundColor = dafaultBackgroundColor
        }
    }
    @IBInspectable var dafaultBorderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = dafaultBorderColor.cgColor
        }
    }
    @IBInspectable var dafaultBorderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = dafaultBorderWidth
        }
    }

    @IBInspectable var focusedButtonTitleColor: UIColor = UIColor.darkGray
    @IBInspectable var focusedBackgroundColor: UIColor = UIColor.clear
    @IBInspectable var focusedBorderColor: UIColor = UIColor.clear
    @IBInspectable var focusedBorderWidth: CGFloat = 0.0
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        if let nextFocusedView = context.nextFocusedView, nextFocusedView == self {
            updateNextFocusedView()
        }
        
        if let previouslyFocusedView = context.previouslyFocusedView, previouslyFocusedView == self {
            updatepreviouslyFocusedView()
        }
    }
    
    private func updateNextFocusedView() {
        self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        self.backgroundColor = focusedBackgroundColor
        self.setTitleColor(focusedButtonTitleColor, for: .normal)
        self.layer.borderWidth = focusedBorderWidth
        self.layer.borderColor = focusedBorderColor.cgColor
    }
    
    private func updatepreviouslyFocusedView() {
        self.transform = .identity
        self.backgroundColor = dafaultBackgroundColor
        self.setTitleColor(dafaultButtonTitleColor, for: .normal)
        self.layer.borderWidth = dafaultBorderWidth
        self.layer.borderColor = dafaultBorderColor.cgColor
    }
}
