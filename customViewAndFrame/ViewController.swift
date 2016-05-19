//
//  ViewController.swift
//  customViewAndFrame
//
//  Created by Админ on 28.04.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

import UIKit
/* UIWindow -> UIView (ViewController) -> UIView (Frames) */

class ViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
/* Custom data formatter as a closure expression */
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter();
        nf.numberStyle = .DecimalStyle;
        nf.minimumFractionDigits = 0;
        nf.maximumFractionDigits = 1;
        return nf;
    }()
    
/* Set a property observer that will call a func if value changed */
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9);
        } else {
            return nil;
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value);
        } else {
            celsiusLabel.text = "???"
        }
    }

/* Connect with "editing changed" from story board */
    @IBAction func textFieldDidReceiveNumber(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value;
        } else {
            fahrenheitValue = nil;
        }
    }
    
/* Add tap gesture recognizer from story board and connect */
    @IBAction func desmissKeyBoard(sender: AnyObject) {
        textField.resignFirstResponder();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
/* Create a custom view and add it to the view hierarchy */
        let firstFrame = CGRect(x: 0, y: 20, width: view.frame.width, height: 20);
        let firstView = UIView(frame: firstFrame);
        firstView.backgroundColor = UIColor.lightGrayColor();
        view.addSubview(firstView);
        
                    /* Create a custom view and add it as a subview */
        let secondFrame = CGRect(x: 0, y: 0, width: firstFrame.width/2, height: firstFrame.height);
        let secondView = UIView(frame: secondFrame);
        secondView.backgroundColor = UIColor.blueColor();
        firstView.addSubview(secondView);
    }
}