import Vision
import XCTest
@testable import PetFocus

@available(iOS 13.0, *)
final class PetObservationTests: XCTestCase {
    private class MockResizableImage: UIImage {
        var overrideScale = CGFloat(1)
        var overrideSize = CGSize.zero

        override var scale: CGFloat { return overrideScale }
        override var size: CGSize { return overrideSize }
    }

    private struct MockRecognizedObjectObservation: RecognizedObjectObservation {
        let boundingBox: CGRect
        let uuid = UUID()
    }

    func testFlipsRecognizedObservations() {
        let sampleObservation = MockRecognizedObjectObservation(boundingBox: CGRect(x: 0.2, y: 0.2, width: 0.4, height: 0.4))
        let sampleImage = MockResizableImage()
        sampleImage.overrideSize = CGSize(width: 100, height: 100)

        let actualObservation = PetObservation(sampleObservation, in: sampleImage)
        let expectedBounds = CGRect(x: 20, y: 40, width: 40, height: 40)
        XCTAssertEqual(actualObservation.bounds, expectedBounds)
        XCTAssertEqual(sampleObservation.uuid, actualObservation.uuid)
    }

    static var allTests = [
        ("testFlipsRecognizedObservations", testFlipsRecognizedObservations)
    ]
}
