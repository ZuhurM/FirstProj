//
//  TimerViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 24.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var timer = Timer()
    var counter = 0.0
    var isTimerRuning = false
   
    var task: Task? {
      didSet {
        setState()
       // updateTime()
      }
    }
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func playAction(_ sender: Any) {
        if !isTimerRuning{
             let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                         selector: #selector(runTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            
            self.timer = timer
        }
    }
    @IBAction func resetAction(_ sender: Any) {
        timer.invalidate()
        counter = 0
        label.text = "0"
    }
    @IBAction func pauseAction(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func runTimer(){
       // guard let visible = 
        counter += 0.1
        label.text = "\(counter)"
       // let time = Date().timeIntervalSince(task.)
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter/3600
        let minute = (flooredCounter % 3600)/60
        var minuteString = "\(minute)"
        if minute < 10{
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10{
            secondString = "0\(second)"
        }
        label.text = "\(hour):\(minuteString):\(secondString)"
    }

    private func setState() {
      guard let task = task else {
        return
        }}
      
   /*   if task.completed {
        taskLabel.attributedText = NSAttributedString(string: task.name,
          attributes: [.strikethroughStyle: 1])
      } else {
        taskLabel.attributedText = NSAttributedString(string: task.name,
          attributes: nil)
      }
    }*/
}
