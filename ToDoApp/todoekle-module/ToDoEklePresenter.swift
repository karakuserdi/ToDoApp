//
//  ToDoEklePresenter.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoEklePresenter:ViewToPresenterEkleProtocol{
    var ekleInteractor: PresenterToInteractorEkleProtocol?
    
    func ekle(liste_ad: String, liste_tarih: String, liste_renk: String) {
        ekleInteractor?.listeEkle(liste_ad: liste_ad, liste_tarih: liste_tarih, liste_renk: liste_renk)
    }
}
