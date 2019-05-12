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
    static public func LeggiScore(chiave : String) -> String
    {
        return UserDefaults.standard.string(forKey: chiave) ?? String("0")
    }
    
    static public func SalvaScore(Score: Int, chiave: String)
    {
        //Best score
        if Score > Int(UserDefaults.standard.string(forKey: chiave) ?? String("0"))!
        {
            UserDefaults.standard.set(Score, forKey: chiave)
        }
    }
}
