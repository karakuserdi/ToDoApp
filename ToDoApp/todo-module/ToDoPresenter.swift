//
//  ToDoPresenter.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoPresenter: ViewToPresenterProtocol{
    var todoInteractor: PresenterToInteractorProtocol?
    var todoView: PresenterToViewProtocol?
    
    func listeyiAl() {
        todoInteractor?.tumListeyiAl()
    }
    
    func ara(liste_ad: String) {
        todoInteractor?.listeAra(liste_ad: liste_ad)
    }
    
    func sil(liste_id: Int) {
        todoInteractor?.listeYapilacaklarSil(liste_id: liste_id)
    }
}

extension ToDoPresenter:InteractorToPresenterProtocol{
    func presenteraVeriGonder(liste: Array<Liste>) {
        todoView?.viewaVeriGonder(liste: liste)
    }
}
