//
//  ViewController.swift
//  Flash App
//
//  Created by oneonlee on 2021/06/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onButtonDidClick(_ sender: Any) {
        view.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        imageView.image = UIImage(systemName: "flashlight.on.fill")
    }
    
    @IBAction func offButtonClick(_ sender: Any) {
        view.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        imageView.image = UIImage(systemName: "flashlight.off.fill")
    }
}
