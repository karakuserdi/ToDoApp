//
//  Liste.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 29.12.2021.
//

import Foundation
import UIKit

class Liste{
    var liste_id:Int?
    var liste_ad:String?
    var liste_tarih:String?
    var liste_renk:String?
    
    init(){}
    
    init(liste_id:Int,liste_ad:String,liste_tarih:String,liste_renk:String){
        self.liste_id = liste_id
        self.liste_ad = liste_ad
        self.liste_tarih = liste_tarih
        self.liste_renk = liste_renk
    }
}
