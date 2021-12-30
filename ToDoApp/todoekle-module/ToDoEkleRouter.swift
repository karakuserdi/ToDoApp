//
//  ToDoEkleRouter.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoEkleRouter:PresenterToRouterEkleProtocol{
    static func createModule(ref: ToDoEkleViewController) {
        ref.eklePresenterNesnesi = ToDoEklePresenter()
        ref.eklePresenterNesnesi?.ekleInteractor = ToDoEkleInteractor()
    }
}
