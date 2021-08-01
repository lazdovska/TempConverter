//
//  InfoViewController.swift
//  TempConverter
//
//  Created by kristine.lazdovska on 31/07/2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = ""
    var appDescText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !infoText.isEmpty && !appDescText.isEmpty{
            appInfoLabel.text = infoText
            appDescLabel.text = appDescText
        }
    }
    
}
