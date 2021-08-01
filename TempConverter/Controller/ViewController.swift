//
//  ViewController.swift
//  TempConverter
//
//  Created by kristine.lazdovska on 30/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet{
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }
    var calculatedValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        print("tempSlider:", tempSlider.value)
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    func updateTempLabelForSlider(value: Float){
        
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) ºC"
        
        var convertedTempString = ""
        switch tempSegmentControl.selectedSegmentIndex {
        case 0:
            let fahrenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahrenheitTempString + " ºF"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " ºK"
        }
        convertedTempLabel.text = convertedTempString
        
        calculatedValue = convertedTempString
    }
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double){
        let fahrenheit = Double(celsius * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tempConverter" {
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! InfoViewController
            // Pass the selected object to the new view controller.
            
            vc.infoText = "My home task was to convert\n temperatures and result is:"
            vc.appDescText = calculatedValue
        }
    }
}
