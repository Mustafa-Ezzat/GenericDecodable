import Foundation
import XCTest

class SearchResponsableMock: GenericDecodable {
    typealias T = SearchResponse
}

class SearchDecodableMockTests: XCTestCase {
    // sut: mean system under test
    var sut: SearchResponsableMock!
    
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = SearchResponsableMock()
    }
    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }
    func testSearchDecodableMock_ResultCount() {
        guard let data = SearchConstants.sampleData.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        self.sut.map(data) { result in
            switch(result) {
            case .success(let response):
                XCTAssertEqual(response.resultCount, 50)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    func testSeachDecodableMock_First_ArtistName() {
        guard let data = SearchConstants.sampleData.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        self.sut.map(data) { result in
            switch(result) {
            case .success(let response):
                XCTAssertEqual(response.results?[0].artistName, "Adele")
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
}

SearchDecodableMockTests.defaultTestSuite.run()
