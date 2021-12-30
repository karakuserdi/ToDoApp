//
//  ToDoDetayRouter.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoDetayRouter:PresenterToRouterDetayProtocol{
    static func createModule(ref: ToDoDetayViewController) {
        let presenter = ToDoDetayPresenter()
        
        ref.detayPresenterNesnesi = presenter
        
        ref.detayPresenterNesnesi?.detayInteractor = ToDoDetayInteractor()
        ref.detayPresenterNesnesi?.detayView = ref
        
        ref.detayPresenterNesnesi?.detayInteractor?.detayPresenter = presenter
    }
}
