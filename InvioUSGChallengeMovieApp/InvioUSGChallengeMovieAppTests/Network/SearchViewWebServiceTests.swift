//
//  SearchViewWebServiceTests.swift
//  InvioUSGChallengeMovieAppTests
//
//  Created by engin gülek on 6.10.2022.
//

import XCTest
@testable import InvioUSGChallengeMovieApp
class SearchViewWebServiceTests: XCTestCase {
    var spi: MockSearchWebService!
    var resutlReturn = "False"
    override func setUpWithError() throws {
        spi = MockSearchWebService()
    }

    override func tearDownWithError() throws {
        spi = nil
    }
    
    func testSearchMovieWebService_WhenGivenSuccessfulResponse_ReturnsSuccess(){
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        spi.getSearchMovie(searchText: "Batman") { result in
            switch result {
            case .success(let result):
                self.resutlReturn = result.Response!
                XCTAssertEqual(self.resutlReturn, "True","Searchweb service returned FALSE")
                expectation.fulfill()
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        self.wait(for: [expectation], timeout: 5)
        
    }
}
