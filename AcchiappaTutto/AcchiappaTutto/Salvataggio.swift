//
//  Salvataggio.swift
//  AcchiappaTutto
//
//  Created by Elia Bernardi on 04/05/2019.
//  Copyright © 2019 Elia Bernardi. All rights reserved.
//

import Foundation

class SalvaScore
{
    static public func LeggiScore() -> String
    {
        //var ArrayValori = [String]()
        
        return UserDefaults.standard.string(forKey: "score") ?? String("0")
        /*if valori == nil
        {
            ArrayValori.append("0")
        }
        else
        {
            
        }*/
        
    }
    
    static public func SalvaScore(Score: Int)
    {
        //Best score
        if Score > Int(UserDefaults.standard.string(forKey: "score") ?? String("0"))!
        {
            UserDefaults.standard.set(Score, forKey: "score")
        }
    }
}
