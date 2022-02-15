//
//  ArticleInteractor.swift
//  Clean SwiftTests
//
//  Created by Ernest Migranov on 10.02.2022.
//

import Foundation

@testable import Clean_Swift
import XCTest

class ArticlesPresentationLogicSpy: ArticlesPresentationLogic{
    
    private(set) var isCalledPresent = 0 //булеву делать
    

    func present(data: [ArticleBackendModel]) {
        isCalledPresent += 1
    }
    
    
}

