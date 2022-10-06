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
    
    func testSearchViewController_WhenCreates_HasSearchButtonAndAction() throws {
        let searchButton : UIButton = try XCTUnwrap(svc.searchButton,"Search Button dores not have a referencing outles")
        
        let searchButtonActions = try XCTUnwrap(searchButton.actions(forTarget:svc ,forControlEvent: .touchUpInside),"Search button does not have any actions assigned to it")
        
        XCTAssertEqual(searchButtonActions.count, 1)
        XCTAssertEqual(searchButtonActions.first,"searchMovieAction:","There is no action with a name searchMovieAction assigned to signup button")
        
    }

 



}





 
