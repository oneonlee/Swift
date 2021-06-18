//
//  ViewController.swift
//  Ramen Timer
//
//  Created by oneonlee on 2021/06/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var secondsLeft: Int = 180
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerButton.layer.cornerRadius = 10
        
    }

    func resetTimer() {
        timer?.invalidate() //timer를 cancel 함
        timer = nil
        timerButton.setTitle("타이머 시작하기", for: .normal)
    }
    
    func updateTimerLabel() {
        let minutes = self.secondsLeft / 60
        let seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 10 {
            self.timerLabel.textColor = UIColor.red
        } else {
            self.timerLabel.textColor = UIColor.black
        }
        
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom)  {
            if self.secondsLeft > 0 {
                //self.timerLabel.text = "\(minutes):\(seconds)"
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            } else {
                self.timerLabel.text = "라면 완성!"
            }
        } completion: { (animated) in
            
        }
    }
    
    
    @IBAction func sermentValueChanged(_ sender: Any) {
        self.resetTimer()
        if segment.selectedSegmentIndex == 0 {
            self.secondsLeft = 180
        } else if segment.selectedSegmentIndex == 1 {
            self.secondsLeft = 240
        } else {
            self.secondsLeft = 300
        }
        updateTimerLabel()
    }
    
    @IBAction func timerButtonClicked(_ sender: Any) {
        if timer != nil {
            resetTimer()
            return
        }
        
        self.timerButton.setTitle("타이머 종료하기", for: .normal)

        self.updateTimerLabel()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
            self.secondsLeft -= 1
            
            self.updateTimerLabel()
            
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
    }
}

