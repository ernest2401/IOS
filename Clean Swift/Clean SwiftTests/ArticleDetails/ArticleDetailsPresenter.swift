//
//  ArticleDetailsPresenter.swift
//  Clean SwiftTests
//
//  Created by Ernest Migranov on 14.02.2022.
//

import Foundation
import XCTest

@testable import Clean_Swift

class ArticleDetailsPresenter: XCTestCase {
    
    private var sut: ArticleDetailsPresentationLogicSpy!
    
    override func setUp() {
        super.setUp()

        let articlesDetailsPresenter = ArticleDetailsPresentationLogicSpy()
        
        sut = articlesDetailsPresenter
        
      }

      override func tearDown() {
        super.tearDown()
        sut = nil
      }

      // MARK: - Public Methods

      func testPresent() {
          sut.present(data: 1, image: true)
          sut.present(data: 2, image: true)
          sut.present(data: 3, image: false)
          
          XCTAssertEqual(sut.isCalledDisplayWithImage, 2,"some message")
          XCTAssertEqual(sut.isCalledDisplayWithoutImage, 1,"some message")
      }

      func testSelectUser() {
        // ...
      }
}
