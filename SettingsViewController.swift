//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Qihui Yang on 3/4/17.
//  Copyright © 2017 Qihui Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var tipControl: UISegmentedControl!
    
    var newRate = 0.00
    let tipPercentages:Array = [0.10, 0.15, 0.18, 0.2, 0.25]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read data from storage
        let readValue = defaults.double(forKey: "Percentage")
        
        // Find the index of tipControl
        var idx = 0
        for item in tipPercentages {
            if item == readValue {
                break
            }
            idx = idx + 1
        }
        // Update current selectedSegment index
        tipControl.selectedSegmentIndex = idx
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRate(_ sender: AnyObject) {
        
        newRate = tipPercentages[tipControl.selectedSegmentIndex]
        
        // Save the new percentage
        defaults.set(newRate, forKey: "Percentage")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
