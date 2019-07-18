import Vision
import XCTest
@testable import PetFocus

@available(iOS 13.0, *)
final class PetDetectionOperationTests: XCTestCase {
    class MockImageRequestHandler: ImageRequestHandler {
        func perform(_ requests: [VNRequest]) throws {
            requests.forEach { $0.completionHandler?($0, nil) }
        }
    }

    func testOperationCompletesWhenRequestsFinish() {
        let operationQueue = OperationQueue()
        let completionExpectation = expectation(description: "operation completed")
        let detectionOperation = PetDetectionOperation(image: UIImage()) { _, _ in
            completionExpectation.fulfill()
        }
        detectionOperation.imageRequestHandler = MockImageRequestHandler()

        operationQueue.addOperation(detectionOperation)
        waitForExpectations(timeout: 1)
    }

    static var allTests = [
        ("testOperationCompletesWhenRequestsFinish", testOperationCompletesWhenRequestsFinish)
    ]
}
