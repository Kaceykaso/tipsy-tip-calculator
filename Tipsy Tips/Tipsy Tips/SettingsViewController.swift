//
//  SettingsViewController.swift
//  Tipsy Tips
//
//  Created by Kacey Coughlin on 9/6/15.
//  Copyright (c) 2015 Kacey Coughlin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var defaultTip15Button: UIButton!
    @IBOutlet weak var defaultTip20Button: UIButton!
    @IBOutlet weak var defaultTip25Button: UIButton!
    
    let defaultTipKey = "tipDefault"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check for stored defaults
        var defaults = NSUserDefaults.standardUserDefaults()
        if let tip = defaults.stringForKey(defaultTipKey) {
            if tip == "15" {
                defaultTip15Button.selected = true
            } else if tip == "25" {
                defaultTip25Button.selected = true
            } else {
                defaultTip20Button.selected = true
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onBackButtonTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func on15tap(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("15", forKey: defaultTipKey)
        defaults.synchronize()
        defaultTip15Button.selected = true
        defaultTip20Button.selected = false
        defaultTip25Button.selected = false
    }
    
    @IBAction func on20tap(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("20", forKey: defaultTipKey)
        defaults.synchronize()
        defaultTip15Button.selected = false
        defaultTip20Button.selected = true
        defaultTip25Button.selected = false
    }
    
    @IBAction func on25tap(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("25", forKey: defaultTipKey)
        defaults.synchronize()
        defaultTip15Button.selected = false
        defaultTip20Button.selected = false
        defaultTip25Button.selected = true
    }

}
