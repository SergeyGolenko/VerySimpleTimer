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
      counterTimer += 10
      updateLabel()
     
    }
    
    @IBAction func buttonMinusTen(_ sender: Any) {
        if counterTimer > 10{
        counterTimer -= 10
            updateLabel()
        }
    }
    
    @IBAction func buttonReset(_ sender: Any) {
        timer.invalidate()
        counterTimer = 20
        updateLabel()
        timeLabel.textColor = .black
        
    }
    
    
    @objc func puskTimer(){
        
        if counterTimer >= 0{
          updateColorTimer()
          updateLabel()
            counterTimer -= 1
        } else {
            timer.invalidate()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
 
    }
    
    func startMyTimer(){
        self.timer = Timer.scheduledTimer(timeInterval:interval, target: self, selector: #selector(puskTimer), userInfo: nil, repeats: true)
    }
    
    func updateLabel(){
        timeLabel.text = String(counterTimer)
    }
    
    func updateColorTimer(){
        if counterTimer <= 3{
            timeLabel.textColor = .red
        } else if counterTimer > 3 && counterTimer < 10 {
            timeLabel.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        }
    
    }


}


