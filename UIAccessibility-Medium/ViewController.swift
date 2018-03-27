//
//  ViewController.swift
//  UIAccessibility-Medium
//
//  Created by Gustavo Severo on 27/03/18.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var initialValue = 30
    var timer: Timer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startAction(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
}

// MARK: - Events -

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibility()
    }
}

// MARK: - Timer -

extension ViewController {
    @objc func runTimer(){
        
        if initialValue == 0 {
            timer.invalidate()
            initialValue = 30
            timerLabel.text = "\(initialValue)"
            timerLabel.accessibilityLabel = "\(initialValue)"
            return
        }
        
        initialValue = initialValue - 1
        timerLabel.text = "\(initialValue)"
        timerLabel.accessibilityLabel = "\(initialValue)"
        
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, "\(initialValue)")
    }
}

// MARK: - Accessibility -
extension ViewController {
    func setAccessibility() {
        
        titleLabel.accessibilityLabel = "Timer Acessível"
        titleLabel.accessibilityTraits = UIAccessibilityTraitStaticText
        
        timerLabel.accessibilityLabel = "30"
        timerLabel.accessibilityTraits = UIAccessibilityTraitUpdatesFrequently
        
        startButton.accessibilityLabel = "Iniciar contador"
        startButton.accessibilityHint = "Dê dois toques para iniciar o contador."
        startButton.accessibilityTraits = UIAccessibilityTraitButton
    }
}

