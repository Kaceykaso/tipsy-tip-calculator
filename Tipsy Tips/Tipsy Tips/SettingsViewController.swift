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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onBackButtonTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
