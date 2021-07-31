//
//  AppearenceViewController.swift
//  TempConverter
//
//  Created by kristine.lazdovska on 31/07/2021.
//

import UIKit

class AppearenceViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        openSettings()
    }
    
    func setLabelText() {
        var text = "Unable to specify IU style"
        if self.traitCollection.userInterfaceStyle == .dark{
            text = "Dark Mode is On\nGo to settings if you would like\nto change to Light Mode."
        }else{
            text = "Light Mode is On\nGo to settings if you would like\nto change to Dark Mode."
        }
        textLabel.text = text
        
    }
    
    func openSettings(){
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { success in
                print ("success:", success)
            }
        }
    }
} //end class


extension AppearenceViewController{
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}

