//
//  ViewController.swift
//  TipCalculator
//
//  Created by Qihui Yang on 3/4/17.
//  Copyright © 2017 Qihui Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    let tipPercentages:Array = [0.15, 0.18, 0.2]
    let defaults = UserDefaults.standard
    
    
    override func viewWillAppear(_ animated: Bool) {
        billField.center.y -= view.bounds.width
        tipLabel.center.y -= view.bounds.width
        totalLabel.center.y -= view.bounds.width
        
        UIView.animate(withDuration: 0.8, animations: {
            self.billField.center.y += self.view.bounds.width
            self.tipLabel.center.y += self.view.bounds.width
            self.totalLabel.center.y += self.view.bounds.width
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Read storaged percentage
        let readValue = defaults.double(forKey: "Percentage")
        // print("Read/New percentage from storage: ", readValue)

        // Find the index of tipControl and update view
        var idx = 0
        for item in tipPercentages {
            if item == readValue {
                break
            }
            idx = idx + 1
        }
        tipControl.selectedSegmentIndex = idx
        
        // Compute new total
        let bill = Double(billField.text!) ?? 0
        let tip = bill * readValue
        let total = bill + tip
        // Show new total
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var defaultRate = 0.15
        
        let readRate = defaults.double(forKey: "Percentage")
        
        if readRate != nil{
            print ("Read from straoge:", readRate)
            defaultRate = readRate
        }
        
        //defaults.set(defaultRate, forKey: "Percentage")
        //defaults.synchronize()
        //print ("Set default percentage:", defaultRate)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}




