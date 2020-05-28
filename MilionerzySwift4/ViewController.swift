//
//  ViewController.swift
//  MilionerzySwift4
//
//  Created by LM88 on 12/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var startButt: UIButton!
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.setGradient(colorOne: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),colorTwo: #colorLiteral(red: 0.7490196078, green: 0.9254901961, blue: 1, alpha: 1),colorTree:#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),colorFour: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),colorFive: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        view.setGradient(colorOne: #colorLiteral(red: 0.3254901961, green: 0.1058823529, blue: 0.3803921569, alpha: 1),colorTwo: #colorLiteral(red: 0.2823529412, green: 0.368627451, blue: 0.631372549, alpha: 1),colorTree:#colorLiteral(red: 0.3254901961, green: 0.3725490196, blue: 0.5607843137, alpha: 1),colorFour: #colorLiteral(red: 0.6, green: 0.7607843137, blue: 0.9411764706, alpha: 1))
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
   
    
    
    
    
    @IBAction func exit2(_ sender: Any) {
        exit(0)
    }
    

}

