//
//  ToDoEkleInteractor.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoEkleInteractor:PresenterToInteractorEkleProtocol{
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("listem.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func listeEkle(liste_ad: String, liste_tarih: String, liste_renk: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO liste (liste_ad,liste_tarih,liste_renk) VALUES (?,?,?)", values: [liste_ad,liste_tarih,liste_renk])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
