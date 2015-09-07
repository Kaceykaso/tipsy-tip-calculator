//
//  ViewController.swift
//  Tipsy Tips
//
//  Created by Kacey Coughlin on 9/6/15.
//  Copyright (c) 2015 Kacey Coughlin. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var broughtFriendsLabel: UILabel!
    @IBOutlet weak var twoPplTotalLabel: UILabel!
    @IBOutlet weak var threePplTotalLabel: UILabel!
    @IBOutlet weak var fourPplTotalLabel: UILabel!
    @IBOutlet weak var twoMonkeys: UILabel!
    @IBOutlet weak var threeMonkeys: UILabel!
    @IBOutlet weak var fourMonkeys: UILabel!
    @IBOutlet weak var twoPplMessageButton: UIButton!
    @IBOutlet weak var threePplMessageButton: UIButton!
    @IBOutlet weak var fourPplMessageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Hide split details
        broughtFriendsLabel.hidden = true
        twoMonkeys.hidden = true
        threeMonkeys.hidden = true
        fourMonkeys.hidden = true
        twoPplTotalLabel.hidden = true
        threePplTotalLabel.hidden = true
        fourPplTotalLabel.hidden = true
        twoPplMessageButton.hidden = true
        threePplMessageButton.hidden = true
        fourPplMessageButton.hidden = true
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.layer.borderColor = UIColor( red: 0.94, green: 1.0, blue: 0.99, alpha: 1.0 ).CGColor
        billField.layer.cornerRadius = 3.0
        billField.layer.borderWidth = 2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = Double((billField.text as NSString).doubleValue)
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Split the bill
        var twoTotal = total / 2
        var threeTotal = total / 3
        var fourTotal = total / 4
        
        twoPplTotalLabel.text = "$\(twoTotal)"
        twoPplTotalLabel.text = String(format: "$%.2f", twoTotal)
        
        threePplTotalLabel.text = "$\(threeTotal)"
        threePplTotalLabel.text = String(format: "$%.2f", threeTotal)
        
        fourPplTotalLabel.text = "$\(fourTotal)"
        fourPplTotalLabel.text = String(format: "$%.2f", fourTotal)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
        // Show split details
        broughtFriendsLabel.hidden = false
        twoMonkeys.hidden = false
        threeMonkeys.hidden = false
        fourMonkeys.hidden = false
        twoPplTotalLabel.hidden = false
        threePplTotalLabel.hidden = false
        fourPplTotalLabel.hidden = false
        twoPplMessageButton.hidden = false
        threePplMessageButton.hidden = false
        fourPplMessageButton.hidden = false
    }
    
    @IBAction func onTwoPplMessage(sender: AnyObject) {
        // Check if able to send messages
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            messageVC.messageComposeDelegate = self
            messageVC.recipients = ["Enter recipients"]
            messageVC.body = "Hey bro, your share is \(twoPplTotalLabel.text)"
            self.presentViewController(messageVC, animated: true, completion: nil)
        } else {
            self.noMessages(self)
        }
    }
    
    @IBAction func onThreePplMessage(sender: AnyObject) {
        // Check if able to send messages
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            messageVC.messageComposeDelegate = self
            messageVC.recipients = ["Enter recipients"]
            messageVC.body = "Hey bros, your share is \(threePplTotalLabel.text)"
            self.presentViewController(messageVC, animated: true, completion: nil)
        } else {
            self.noMessages(self)
        }
    }
    
    
    @IBAction func onFourPplMessage(sender: AnyObject) {
        // Check if able to send messages
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            messageVC.messageComposeDelegate = self
            messageVC.recipients = ["Enter recipients"]
            messageVC.body = "Hey bros, your share is \(fourPplTotalLabel.text)"
            self.presentViewController(messageVC, animated: true, completion: nil)
        } else {
            self.noMessages(self)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func noMessages(sender: AnyObject) {
        // When sending a message fails...
        let alertController = UIAlertController(title: "Uh oh!", message:
            "User hasn't setup Messages.app!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

