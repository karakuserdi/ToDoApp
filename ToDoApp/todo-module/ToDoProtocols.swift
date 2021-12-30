//
//  ToDoProtocols.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

protocol PresenterToInteractorProtocol{
    var todoPresenter:InteractorToPresenterProtocol? {get set}
    
    func tumListeyiAl()
    func listeAra(liste_ad:String)
    func listeYapilacaklarSil(liste_id:Int)
}

protocol ViewToPresenterProtocol{
    var todoInteractor:PresenterToInteractorProtocol? {get set}
    var todoView:PresenterToViewProtocol? {get set}
    
    func listeyiAl()
    func ara(liste_ad:String)
    func sil(liste_id:Int)
}

protocol InteractorToPresenterProtocol{
    func presenteraVeriGonder(liste: Array<Liste>)
}

protocol PresenterToViewProtocol{
    func viewaVeriGonder(liste: Array<Liste>)
}

protocol PresenterToRouterProtocol{
    static func createModule(ref: ToDoViewController)
}
