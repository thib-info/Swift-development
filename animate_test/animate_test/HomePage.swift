//
//  ViewController.swift
//  animate_test
//
//  Created by Thibault Buze on 24/01/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UITextFieldDelegate {
    
    // Variables
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var tfUser: UITextField!
    @IBOutlet var bSetting: UIButton!
    @IBOutlet var SwSegue: UISwitch!
    var stepperTouch: Int = 0
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stepper.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(moveStepper)))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(oneToucheScreen)))
        tfUser.delegate = self
        tfUser.text = text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // the delegate
        self.view.endEditing(true)
        return true
    }
    
    @objc func oneToucheScreen(sender: UITapGestureRecognizer){ // One touch on the screen
        self.view.endEditing(true)
    }
    
    @IBAction func ValueTextField(sender: UITextField){
        let number = Double(sender.text!)
        stepper.value = number ?? stepper.value
    }
    
    @IBAction func ValueStepper(sender: UIStepper){ // When we use the stepper
        tfUser.text = String(Int(sender.value))
        if sender.value >= 10 && SwSegue.isOn {
            buttonOn()
        }else{
            buttonOff()
        }
        
        stepperTouch += 1
    }
    
    @IBAction func SwitchValueChange(sender: UISwitch){ // If we change the switch's value
        if sender.isOn && Int(stepper.value)>=10{
            buttonOn()
        }
        
        if !sender.isOn{
            buttonOff()
        }
    }
    
    func buttonOn(){ // activate the button
        bSetting.isEnabled = true
        bSetting.isHidden = false
    }
    
    func buttonOff(){ // desactivate the button
        bSetting.isEnabled = false
        bSetting.isHidden = true
    }
    
    @objc func moveStepper(sender: UIPanGestureRecognizer){ // for the path animation
        
        let step = sender.view! // Decalaration of the stepper
        let center_window: CGPoint = self.view.center

            switch sender.state {
                    
                case .changed:
                    let position_finger = sender.location(in: self.view) // finger's position
                    step.center = position_finger
                    
                case .ended:
                    let text = Int(stepper.value)
                    
                    if step.center.x <= center_window.x{
                        stepper.value += 1
                    }else{
                        stepper.value -= 1
                    }
                    
                    tfUser.text = "\(text)"
                    
                    UIView.animate(withDuration: 0.5) {
                        step.center = center_window
                }
                    
                default: ()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Send the value of the TextField
        if segue.identifier == "MoveSettings"{
            let setting = segue.destination as! Settings
            setting.value = String(stepper.value)
            setting.stepperPress = String(stepperTouch)
        }
    }
}

