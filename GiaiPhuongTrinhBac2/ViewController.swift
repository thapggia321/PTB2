//
//  ViewController.swift
//  GiaiPhuongTrinhBac2
//
//  Created by congminh on 5/16/18.
//  Copyright © 2018 congminh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var txta: UITextField!
    @IBOutlet var txtb: UITextField!
    @IBOutlet var txtc: UITextField!
    @IBOutlet var lblnghiem1: UILabel!
    @IBOutlet var lblnghiem2: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblnghiem1.isHidden = true
        lblnghiem2.isHidden = true
        self.txta.delegate = self
        self.txtb.delegate = self
        self.txtc.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn: "0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        if filtered == string{
            return true
        } else{
            if string == "."{
                let countdots = textField.text!.components(separatedBy: ".").count - 1
                if countdots == 0{
                    return true
                } else{
                    if countdots > 0 && string == "."{
                        return false
                    } else{
                        return true
                    }
                }
            } else{
                if string == "-"{
                    if (textField.text?.isEmpty == true){
                        return true
                    } else{
                        return false
                    }
                } else{
                    return false
                }
            }
        }
    }


    @IBAction func btngiaipt(_ sender: Any) {
        lblnghiem2.text = ""
        lblnghiem1.isHidden = false
        if(txta.text! == "" || txtb.text! == "" || txtc.text! == "")
        {
            lblnghiem1.text = "Ban can nhap day du cac so a,b va c"
        }
        else
        {
            let a:Double = Double(txta.text!)!
            let b:Double = Double(txtb.text!)!
            let c:Double = Double(txtc.text!)!
            
            if(a==0){
                if(b==0){
                    if(c==0){
                        lblnghiem1.text = "Phuong trinh co nghiem bat ky"
                    } else{
                        lblnghiem1.text = "Phuong trinh vo nghiem"
                    }
                } else if(c==0){
                    lblnghiem1.text = "x = 0"
                } else{
                    lblnghiem1.text = "x = \(-c/b)"
                }
            } else {
                let delta = ((b*b) - (4*a*c))
                if(delta < 0){
                    lblnghiem1.text = "Phuong trinh vo nghiem"
                } else if(delta == 0){
                    let x = (-b) / (2*a)
                    lblnghiem1.text = "x = \(x)"
                } else{
                    lblnghiem2.isHidden = false
                    let x1 = (-b - sqrt(delta)) / (2*a)
                    let x2 = (-b + sqrt(delta)) / (2*a)
                    lblnghiem1.text = "x1 = \(x1)"
                    lblnghiem2.text = "x2 =\(x2)"
                }
            }
        }
    }
}

