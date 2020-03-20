//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @objc func update() {
        if secondsPassed < totalTime {
            let percentage: Float = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentage
            secondsPassed = secondsPassed + 1
        }
        else {
            progressBar.progress = 1.0
            titleLabel.text = "Done!"
            timer.invalidate()
        }
        
    }
    let eggTimes = ["Soft": 300, "Medium":420, "Hard": 720]
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        titleLabel.text = "Patient!"
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
}
