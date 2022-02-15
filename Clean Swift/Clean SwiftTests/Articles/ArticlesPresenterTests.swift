//
//  ArticleInteractorTests.swift
//  Clean SwiftTests
//
//  Created by Ernest Migranov on 10.02.2022.
//

import Foundation
import XCTest

@testable import Clean_Swift

class ArticlesPresenterTests: XCTestCase{
    
    private var sut : ArticlesPresentationLogicSpy!
    private var presenter: ArticlesPresentationLogicSpy!
    
    override func setUp() {
        super.setUp()

        let articlesPresenter = ArticlesPresentationLogicSpy()
        let articlesPresentationLogic = ArticlesPresentationLogicSpy()
        
        sut = articlesPresenter
        presenter = articlesPresentationLogic
      }

      override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
      }

      // MARK: - Public Methods

      func testPresent() {
          sut.present(data: [])
          
          XCTAssertEqual(sut.isCalledPresent, 1,"some message")
          
      }

      func testSelectUser() {
        // ...
      }
}
