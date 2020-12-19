//
//  ViewController.swift
//  VerySimpleTimer
//
//  Created by Сергей Голенко on 19.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var counterTimer = 20
    var timer = Timer()
    var interval = TimeInterval(1)
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    
    @IBAction func startTimer(_ sender: UIBarButtonItem) {
       startMyTimer()
    }
    @IBAction func stopTimer(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    @IBAction func buttonPlusTen(_ sender: Any) {
      counterTimer = counterTimer + 10
    }
    
    @IBAction func buttonMinusTen(_ sender: Any) {
        if counterTimer > 10{
        counterTimer = counterTimer - 10
        }
    }
    
    @IBAction func buttonReset(_ sender: Any) {
        timer.invalidate()
        counterTimer = 20
        timeLabel.text = String(counterTimer)
        
    }
    
    
    
    
    
    @objc func puskTimer(){
        
        if counterTimer >= 0{
            timeLabel.text = String(counterTimer)
            counterTimer -= 1
        } else {
            timer.invalidate()
        }
  
      
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counterTimer)
 
    }
    
    func startMyTimer(){
        self.timer = Timer.scheduledTimer(timeInterval:interval, target: self, selector: #selector(puskTimer), userInfo: nil, repeats: true)
    }


}


