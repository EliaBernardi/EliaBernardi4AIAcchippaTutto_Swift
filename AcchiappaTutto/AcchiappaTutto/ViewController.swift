//
//  ViewController.swift
//  AcchiappaTutto
//
//  Created by Elia Bernardi on 04/04/2019.
//  Copyright © 2019 Elia Bernardi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var randomAltezza: Int = Int.random(in: 0 ..< Int(view.frame.height))
        var randomLarghezza: Int = Int.random(in: 0 ..< Int(view.frame.width))

        var button = UIButton(frame: CGRect(x: randomLarghezza, y: randomAltezza, width: 130, height: 130))
        
        
        button.setTitle("Prova", for: .normal)
        button.titleLabel!.font =  UIFont(name: ".SFUIText", size: 50)
        self.view.addSubview(button)
    
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

