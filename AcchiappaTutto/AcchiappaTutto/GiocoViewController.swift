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
        
        //W H : 40/580   169/585   303/582
        //W h : 41/701   179/705   312/701
        
        let Posizione1 = CGRect(x: 40, y: 580, width: 84, height: 90)
        let Posizione2 = CGRect(x: 169, y: 585, width: 84, height: 90)
        let Posizione3 = CGRect(x: 303, y: 582, width: 84, height: 90)
        let Posizione4 = CGRect(x: 41, y: 701, width: 84, height: 90)
        let Posizione5 = CGRect(x: 179, y: 705, width: 84, height: 90)
        let Posizione6 = CGRect(x: 312, y: 701, width: 84, height: 90)
        var CoordinateButton = [CGRect]()
        CoordinateButton.append(Posizione1)
        CoordinateButton.append(Posizione2)
        CoordinateButton.append(Posizione3)
        CoordinateButton.append(Posizione4)
        CoordinateButton.append(Posizione5)
        CoordinateButton.append(Posizione6)
        
        var ArrayButton = [UIButton]()
        ArrayButton = RiempiArray(CoordinateButton: CoordinateButton)
        
        
        let Timer = DispatchTime.now()
        var tempo = 1
        
        let image = UIImage(named: "Talpa3")
        for i in 0...9
        {
            let talpa: Int = Int.random(in: 0 ..< 5)
            let button = ArrayButton[talpa]
            button.setImage(image, for: .normal)
            button.addTarget(self, action: #selector(ClickButton(_:)), for: .touchUpInside)
            
            DispatchQueue.main.asyncAfter(deadline: Timer + .seconds(tempo), execute:
            {
                self.view.addSubview(button)
                self.view.bringSubview(toFront: button)
            })
            tempo = tempo + 1
        }

        
}
    
    func RiempiArray(CoordinateButton : [CGRect]) -> [UIButton]
    {
        var ArrayButton = [UIButton]()
        for i in 0...CoordinateButton.count-1
        {
            ArrayButton.append(UIButton(frame: CoordinateButton[i]))
        }
        return ArrayButton
    }
    
    @objc func ClickButton(_ sender: UIButton)
    {
        sender.isHidden = true
    }

}
