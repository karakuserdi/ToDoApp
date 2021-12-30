//
//  Yapilacaklar.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 29.12.2021.
//

import Foundation

class Yapilacaklar{
    var yapilacaklar_id:Int?
    var yapilacaklar_ad:String?
    var yapilacaklar_tarih:String?
    var yapilacaklar_bittimi:String?
    var liste:Liste?
    
    init(){}
    
    init(yapilacaklar_id:Int,yapilacaklar_ad:String,yapilacaklar_tarih:String,yapilacaklar_bittimi:String,liste:Liste){
        self.yapilacaklar_id = yapilacaklar_id
        self.yapilacaklar_ad = yapilacaklar_ad
        self.yapilacaklar_tarih = yapilacaklar_tarih
        self.yapilacaklar_bittimi = yapilacaklar_bittimi
        self.liste = liste
    }
}
