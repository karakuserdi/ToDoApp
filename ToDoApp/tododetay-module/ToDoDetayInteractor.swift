//
//  ToDoDetayInteractor.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoDetayInteractor:PresenterToInteractorDetayProtocol{
    var detayPresenter: InteractorToPresenterDetayProtocol?
    
    let db:FMDatabase?

    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("listem.sqlite")

        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func yapilacaklariAl(liste_id: Int) {
        var liste = [Yapilacaklar]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM liste,yapilacaklar WHERE yapilacaklar.liste_id = liste.liste_id and yapilacaklar.liste_id = ?", values: [liste_id])
            
            while rs.next(){
                let list = Liste(liste_id: Int(rs.string(forColumn: "liste_id"))!,
                                 liste_ad: rs.string(forColumn: "liste_ad")!,
                                 liste_tarih: rs.string(forColumn: "liste_tarih")!,
                                 liste_renk: "liste_renk")
                
                let yapilacaklar = Yapilacaklar(
                    yapilacaklar_id: Int(rs.string(forColumn: "yapilacaklar_id"))!,
                    yapilacaklar_ad: rs.string(forColumn: "yapilacaklar_ad")!,
                    yapilacaklar_tarih: rs.string(forColumn: "yapilacaklar_tarih")!,
                    yapilacaklar_bittimi: rs.string(forColumn: "yapilacaklar_bittimi")!,
                    liste: list)
                
                liste.append(yapilacaklar)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        detayPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
    }

    func yapilacakEkle(liste_id: Int, yapilacaklar_ad: String, yapilacaklar_tarih: String, yapilacaklar_bittimi: String) {
        db?.open()

        do{
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacaklar_ad,yapilacaklar_tarih,yapilacaklar_bittimi,liste_id) VALUES (?,?,?,?)", values: [yapilacaklar_ad,yapilacaklar_tarih,yapilacaklar_bittimi,liste_id])
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
    }

    func yapilacakSil(yapilacaklar_id: Int) {
        db?.open()

        do {
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacaklar_id = ?", values: [yapilacaklar_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    func yapilacakBitti(yapilacaklar_id: Int, yapilacaklar_bittimi: String) {
        db?.open()

        do {
            try db!.executeUpdate("UPDATE yapilacaklar SET yapilacaklar_bittimi = ? WHERE yapilacaklar_id = ?", values: [yapilacaklar_bittimi,yapilacaklar_id])
        } catch {
            print(error.localizedDescription)
        }


        db?.close()
    }
}
