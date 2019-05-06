//
//  GiocoViewController.swift
//  AcchiappaTutto
//
//  Created by Elia Bernardi on 24/04/2019.
//  Copyright © 2019 Elia Bernardi. All rights reserved.
//

import UIKit

class GiocoViewController: UIViewController {
    
    @IBOutlet weak var LabelPunteggio: UILabel!
    
    @IBOutlet weak var LabelBestScore: UILabel!
    
    var NumeroTalpe = 10
    var TalpaPrecedente = -1
    var timer = Timer()
    var ArrayButton = [UIButton]()
    let button : UIButton = UIButton()
    var talpeColpite = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelBestScore.text = SalvaScore.LeggiScore()
        
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
        
        ArrayButton = RiempiArray(CoordinateButton: CoordinateButton)
        
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(MettiTalpe), userInfo: nil, repeats: true)
}
    
    @objc func MettiTalpe()
    {
        if NumeroTalpe == 0
        {
            timer.invalidate()
            SalvaScore.SalvaScore(Score: talpeColpite)
            LabelBestScore.text = SalvaScore.LeggiScore() //Se il top score è cambiato
            button.isHidden = true
        }
        else
        {
            let image = UIImage(named: "Talpa3")
            var talpa: Int = Int(arc4random_uniform(5))
            while talpa == TalpaPrecedente //non faccio comparire 2 talpe nello stesso posto
            {
                talpa = Int(arc4random_uniform(5))
            }
            TalpaPrecedente = talpa
            button.frame = ArrayButton[talpa].frame
            button.setImage(image, for: .normal)
            //button.setTitle(NumeroTalpe.description, for: .normal)
            button.addTarget(self, action: #selector(ClickButton(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            self.view.bringSubview(toFront: button)
            button.isHidden = false //Mostro la talpa nella nuova posizione
            NumeroTalpe -= 1
        }
        LabelPunteggio.text = "Talpe colpite: " + String(talpeColpite) + "/" + "10"
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
        talpeColpite += 1
        sender.isHidden = true
    }

}
