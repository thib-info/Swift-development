//
//  ViewController.swift
//  First_App
//
//  Created by Thibault Buze on 16/01/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Variables intern
    @IBOutlet var btVerif : UIButton!
    @IBOutlet var btHelp : UIButton!
    @IBOutlet var tfAnswer : UITextField!
    @IBOutlet var SwAuto : UISwitch!
    @IBOutlet var stepper : UIStepper!
    @IBOutlet var slidder : UISlider!
    var stateAuto = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tfAnswer.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        slidder.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(cliqueLongsurSlidder)))
        
        stepper.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(GlisserDeposer)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ShowHelp(sender: UIButton){
        alert(title: "Advice", message: "You must put the result of this calcul and after you will pass the challenge !")
    }
    
    @IBAction func ActivateAutoMode(sender: UISwitch){
        btVerif.isHidden = sender.isOn
        stateAuto = sender.isOn
    }
    
    @IBAction func ClearTextField(sender : UITextField){
        tfAnswer.text = ""
    }
    
    @IBAction func CheckAnswerWithButton(sender : UIButton){
        let result = tfAnswer.text
        if result != "" && !stateAuto{
            if result == "8"{
                alert(title: "You win !", message: "This man is born in October you're stronger than i thought...")
            }else{
                alert(title: "Try again", message: "You're answer : " + result! +  " is not the right one")
            }
        }else{
            alert(title: "No anwere had been given !", message: "Put a value before check it plz")
        }
    }
    
    @IBAction func CheckAnswer(sender : UITextField){
        let result = tfAnswer.text
        if result != "" && stateAuto{
            if result == "8"{
                alert(title: "You win !", message: "This man is born in October you're stronger than i thought...")
            }else{
                alert(title: "Try again", message: "You're answer : " + result! + " is not the right one")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let result = tfAnswer.text
        if result != "" && stateAuto{
            if result == "8"{
                alert(title: "You win !", message: "This man is born in October you're stronger than i thought...")
            }else{
                alert(title: "Try again", message: "You're answer : " + result! + " is not the right one")
            }
        }
        tfAnswer.resignFirstResponder()
        return true
    }
    
    @IBAction func modify_value_textField(sender: UITextField){
        let number = Int(tfAnswer.text!)!
        slidder.value = Float(number)
        stepper.value = Double(number)
    }
    
    @IBAction func Slidder_value_change(sender : UISlider){
        var number:Int
        
        if tfAnswer.text != ""{
            number = Int(tfAnswer.text!)!
        }else{
            number = 0
        }
        
        if Int(sender.value) > number {
            tfAnswer.text = String(number+1)
            stepper.value = Double(number+1)
            
        }else{
            tfAnswer.text = String(number-1)
            stepper.value = Double(number-1)
        }
    }
    
    @IBAction func Stepper_presse(sender: UIStepper){
        
        var number:Int
        
        if tfAnswer.text != ""{
             number = Int(tfAnswer.text!)!
        }else{
             number = 0
            }
        
        if Int(stepper.value) > number {
            tfAnswer.text = String(number+1)
            slidder.value = Float(number+1)
        }else{
            tfAnswer.text = String(number-1)
            slidder.value = Float(number-1)
        }
    }
    
    @objc func cliqueLongsurSlidder(sender: UILongPressGestureRecognizer){
        alert(title: "Appuie long ! ", message: "Vous etes reste trop longtemps appuyer sur l'élément !")
    }
    
    @objc func GlisserDeposer(sender : UIPanGestureRecognizer){
        let step = sender.view!
        let origin_position_x : CGFloat = stepper.center.x
        let origin_position_y : CGFloat = stepper.center.y
        let coordonees_doigt = sender.location(in: self.view)
        step.center = coordonees_doigt
        
        if UIGestureRecognizer.State.ended == sender.state {
            let Duration: Double = 0.5
            
            if(step.center.x > origin_position_x){
                if tfAnswer.text != nil{
                    var number:Int
                    number = Int(tfAnswer.text!)!
                    tfAnswer.text = String(number+1)
                }else{
                    tfAnswer.text = String(1)
                }
            }else{
                if tfAnswer.text != nil{
                    var number:Int
                    number = Int(tfAnswer.text!)!
                    if number>0{
                        tfAnswer.text = String(number-1)
                    }
                }
            }
            
            UIView.animate(withDuration: Duration) {
                
            }
            alert(title: "ok", message: "fin animation")
        }
    }
    
    
    //Ouvre une popup
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}

