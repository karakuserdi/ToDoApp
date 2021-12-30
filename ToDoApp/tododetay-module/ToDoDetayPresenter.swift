//
//  ToDoDetayPresenter.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoDetayPresenter: ViewToPresenterDetayProtocol{
    var detayInteractor: PresenterToInteractorDetayProtocol?
    var detayView: PresenterToViewDetayProtocol?
    
    func yapilacaklariAl(liste_id: Int) {
        detayInteractor?.yapilacaklariAl(liste_id: liste_id)
    }
    
    func ekle(liste_id: Int, yapilacaklar_ad: String, yapilacaklar_tarih: String, yapilacaklar_bittimi: String) {
        detayInteractor?.yapilacakEkle(liste_id: liste_id, yapilacaklar_ad: yapilacaklar_ad, yapilacaklar_tarih: yapilacaklar_tarih, yapilacaklar_bittimi: yapilacaklar_bittimi)
    }
    
    func sil(yapilacaklar_id: Int) {
        detayInteractor?.yapilacakSil(yapilacaklar_id: yapilacaklar_id)
    }
    
    func bitti(yapilacaklar_id: Int, yapilacaklar_bittimi: String) {
        detayInteractor?.yapilacakBitti(yapilacaklar_id: yapilacaklar_id, yapilacaklar_bittimi: yapilacaklar_bittimi)
    }
}

extension ToDoDetayPresenter:InteractorToPresenterDetayProtocol{
    func presenteraVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>) {
        detayView?.viewaVeriGonder(yapilacaklarListesi: yapilacaklarListesi)
    }
}
