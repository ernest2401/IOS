//
//  ArticleDetailsPresentationLogic.swift
//  Clean SwiftTests
//
//  Created by Ernest Migranov on 15.02.2022.
//

import Foundation
import Foundation

@testable import Clean_Swift
import XCTest

class ArticleDetailsPresentationLogicSpy: ArticleDetailsPresenterProtocol{
    
    private(set) var isCalledDisplayWithImage = 0
    private(set) var isCalledDisplayWithoutImage = 0
    
    func present(data: Int, image: Bool) {
        if image == true {
            isCalledDisplayWithImage += 1
        } else {
            isCalledDisplayWithoutImage += 1
        }
                
    }
    
    
}
