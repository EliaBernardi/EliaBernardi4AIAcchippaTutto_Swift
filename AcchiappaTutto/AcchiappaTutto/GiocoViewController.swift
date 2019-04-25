//
//  GiocoViewController.swift
//  AcchiappaTutto
//
//  Created by Elia Bernardi on 24/04/2019.
//  Copyright © 2019 Elia Bernardi. All rights reserved.
//

import UIKit

class GiocoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        var randomAltezza: Int = Int.random(in: 0 ..< Int(view.frame.height))
        var randomLarghezza: Int = Int.random(in: 0 ..< Int(view.frame.width))
        
        let button = UIButton(frame: CGRect(x: randomLarghezza, y: randomAltezza, width: 130, height: 130))
        
        let image = UIImage(named: "Talpa3")
        button.setImage(image, for: .normal)
        //button.titleLabel!.font =  UIFont(name: ".SFUIText", size: 50)
        self.view.addSubview(button)
        self.view.bringSubview(toFront: button)
        
    }
    

}
