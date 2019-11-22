//
//  ViewController.swift
//  Happy or Sad
//
//  Created by Landon Follows on 2019-11-18.
//  Copyright © 2019 Landon Follows. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //Analyze the Text
    
    @IBAction func analyze(_ sender: Any) {
      
        //Use Guard Statement for Input
        
        guard let textFieldAsString = textField.text,
            
            textFieldAsString != "" else{
                
            resultLabel.text = "Please enter text"
                
            return
        }
        
        //Max input is 255 charcters
        
        if textFieldAsString.count > 255 {
            
            resultLabel.text = "please enter less characters"
            
            return

        }
       
        //make variable happy and sad count, also what the variables are.
    
        var happyAmount = 0
        
        var sadAmount = 0
        
        let happyFaces = "😀🙂😄😊"
        
        let sadFaces = "☹️🙁😕😔"
        
        //Incpect each character for happy and sad
        
        for character in textFieldAsString {
            
            if happyFaces.contains(character){
                
                happyAmount += 1
            }
            
            if sadFaces.contains(character){
                
                sadAmount += 1
                
            }
        }
        
        //Determining The Happy or Sad
        
        if happyAmount == sadAmount && happyAmount > 1 && sadAmount > 1 {
            resultLabel.text = "Unsure"
            
        } else if happyAmount == 0 && sadAmount == 0 {
            
            resultLabel.text = "None"
            
        } else if happyAmount > sadAmount {
            
            resultLabel.text = "Happy"
            
        } else if happyAmount < sadAmount {
            
            resultLabel.text = "Sad"
            
        }
    }
}
