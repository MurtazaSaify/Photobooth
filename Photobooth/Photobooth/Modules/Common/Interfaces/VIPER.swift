//
//  Interfaces.swift
//  Photobooth
//
//  Created by Murtuza Saify on 26/04/2021.
//


import SwiftUI

// MARK: - VIPER

public protocol RouterInterface: RouterInputInterface {}

public protocol InteractorInterface: InteractorInputInterface {
    associatedtype InteractorOutput
    
    var output: InteractorOutput? { get set }
}

public protocol PresenterInterface: PresenterInputInterface & InteractorOutputInterface {
    associatedtype InteractorInput
    associatedtype RouterInput

    var router: RouterInput? { get set }
    var interactor: InteractorInput? { get set }
    /*var view: ViewPresenter! { get set }*/
}

public protocol ViewInterface/*: ViewPresenterInterface*/ {
    associatedtype PresenterInput
    var presenter: PresenterInput? { get set }
}

// MARK: - "i/o" interfaces

public protocol InteractorInputInterface: class {
    
}

public protocol InteractorOutputInterface: class {
    
}

public protocol PresenterInputInterface: class {
    
}

public protocol PresenterOutputInterface: class {
    
}

public protocol RouterInputInterface: class {
    
}

// MARK: - module

public protocol ModuleInterface {

    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    associatedtype Interactor where Interactor: InteractorInterface
    
    func assemble(/*view: View, */presenter: Presenter, router: Router, interactor: Interactor)
}

public extension ModuleInterface {

    func assemble(/*view: View, */presenter: Presenter, router: Router, interactor: Interactor) {
        /*
        view.presenter = (presenter as! Self.View.PresenterView)
        
        presenter.view = (view as! Self.Presenter.ViewPresenter)
        */
        presenter.interactor = interactor as? Self.Presenter.InteractorInput
        presenter.router = router as? Self.Presenter.RouterInput
        interactor.output = presenter as? Self.Interactor.InteractorOutput
    }
}
