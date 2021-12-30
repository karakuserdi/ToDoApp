//
//  ToDoEkleProtocols.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

protocol PresenterToInteractorEkleProtocol{
    func listeEkle(liste_ad:String, liste_tarih:String, liste_renk:String)
}

protocol ViewToPresenterEkleProtocol{
    var ekleInteractor:PresenterToInteractorEkleProtocol? {get set}
    
    func ekle(liste_ad:String, liste_tarih:String, liste_renk:String)
}

protocol PresenterToRouterEkleProtocol{
    static func createModule(ref: ToDoEkleViewController)
}
