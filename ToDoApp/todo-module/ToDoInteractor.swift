//
//  ToDoInteractor.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoInteractor:PresenterToInteractorProtocol{
    var todoPresenter: InteractorToPresenterProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("listem.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumListeyiAl() {
        var liste = [Liste]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM liste", values: nil)
            
            while rs.next(){
                let list = Liste(liste_id: Int(rs.string(forColumn: "liste_id"))!,
                                 liste_ad: rs.string(forColumn: "liste_ad")!,
                                 liste_tarih: rs.string(forColumn: "liste_tarih")!,
                                 liste_renk: rs.string(forColumn: "liste_renk")!)
                liste.append(list)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        todoPresenter?.presenteraVeriGonder(liste: liste)
    }
    
    func listeAra(liste_ad: String) {
        var liste = [Liste]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM liste WHERE liste_ad like '%\(liste_ad)%'", values: nil)
            
            while rs.next(){
                let list = Liste(liste_id: Int(rs.string(forColumn: "liste_id"))!,
                                 liste_ad: rs.string(forColumn: "liste_ad")!,
                                 liste_tarih: rs.string(forColumn: "liste_tarih")!,
                                 liste_renk: rs.string(forColumn: "liste_renk")!)
                liste.append(list)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        todoPresenter?.presenteraVeriGonder(liste: liste)
    }
    
    func listeYapilacaklarSil(liste_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE liste_id = ?", values: [liste_id])
            try db!.executeUpdate("DELETE FROM liste WHERE liste_id = ?", values: [liste_id])
            tumListeyiAl()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
