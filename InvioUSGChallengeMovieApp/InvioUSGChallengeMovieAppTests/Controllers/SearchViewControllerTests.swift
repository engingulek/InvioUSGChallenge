//
//  SearchViewControllerTests.swift
//  InvioUSGChallengeMovieAppTests
//
//  Created by engin gülek on 6.10.2022.
//


import XCTest
@testable  import InvioUSGChallengeMovieApp
class SearchViewControllerTests: XCTestCase {
    var storyboard: UIStoryboard!
    var svc : SearchViewController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        svc = storyboard.instantiateViewController(identifier: "searchViewController") as? SearchViewController
        svc.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
       storyboard = nil
        svc = nil
    }
    
    func testSearchViewController_WhenCreated_TextFieldEmpty() throws {
        let searchTextField = try XCTUnwrap(svc.searchMovieTextField,"The searchTextField is not connection to an IBOutler")
        XCTAssertEqual(searchTextField.text, "","Search textfield waas not empty whwen the searchViewController initially loadede")
    }

 



}





 
