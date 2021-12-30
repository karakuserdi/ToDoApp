//
//  ToDoRouter.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import Foundation

class ToDoRouter:PresenterToRouterProtocol{
    static func createModule(ref: ToDoViewController) {
        let presenter = ToDoPresenter()
        
        ref.todoPresenterNesnesi = presenter
        ref.todoPresenterNesnesi?.todoInteractor = ToDoInteractor()
        ref.todoPresenterNesnesi?.todoView = ref
        
        ref.todoPresenterNesnesi?.todoInteractor?.todoPresenter = presenter
    }
}
