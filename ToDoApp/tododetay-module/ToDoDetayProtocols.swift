//
//  ToDoDetayProtocols.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

protocol PresenterToInteractorDetayProtocol{
    var detayPresenter:InteractorToPresenterDetayProtocol? {get set}
    
    func yapilacaklariAl(liste_id:Int)
    func yapilacakEkle(liste_id:Int, yapilacaklar_ad:String, yapilacaklar_tarih:String, yapilacaklar_bittimi:String)
    func yapilacakSil(yapilacaklar_id:Int)
    func yapilacakBitti(yapilacaklar_id:Int,yapilacaklar_bittimi:String)
}

protocol ViewToPresenterDetayProtocol{
    var detayInteractor: PresenterToInteractorDetayProtocol? {get set}
    var detayView:PresenterToViewDetayProtocol? {get set}
    
    func yapilacaklariAl(liste_id:Int)
    func ekle(liste_id: Int, yapilacaklar_ad: String, yapilacaklar_tarih:String, yapilacaklar_bittimi: String)
    func sil(yapilacaklar_id:Int)
    func bitti(yapilacaklar_id:Int,yapilacaklar_bittimi:String)
}

protocol InteractorToPresenterDetayProtocol{
    func presenteraVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>)
}

protocol PresenterToViewDetayProtocol{
    func viewaVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>)
}


protocol PresenterToRouterDetayProtocol{
    static func createModule(ref: ToDoDetayViewController)
}

