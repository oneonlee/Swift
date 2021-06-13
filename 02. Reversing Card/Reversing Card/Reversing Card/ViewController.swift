//
//  ViewController.swift
//  Reversing Card
//
//  Created by oneonlee on 2021/06/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onOffSwitchValueChanged(_ sender: Any) {
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.onOffSwitch.isOn {
                self.imageView.image = UIImage(named: "ace")
            } else {
                self.imageView.image = UIImage(named: "poker")
            }
        } completion: { (animated) in
            
        }
    }
}
