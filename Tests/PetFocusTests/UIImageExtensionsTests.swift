import XCTest
@testable import PetFocus

final class UIImageExtensionsTests: XCTestCase {
    func testUnknownOrientationIsUp() {
        let unknownImagePropertyOrientation = UIImage.Orientation(rawValue: 42)
        XCTAssertEqual(unknownImagePropertyOrientation?.cgImagePropertyOrientation, .up)
    }

    func testAllKnownOrientations() {
        let uiImageOrientations = [UIImage.Orientation.up, .down, .left, .right, .upMirrored, .downMirrored, .leftMirrored, .rightMirrored]
        let cgImageOrientations = [CGImagePropertyOrientation.up, .down, .left, .right, .upMirrored, .downMirrored, .leftMirrored, .rightMirrored]
        XCTAssertTrue(zip(uiImageOrientations, cgImageOrientations).allSatisfy({ $0.0.cgImagePropertyOrientation == $0.1
        }))
    }

    static var allTests = [
        ("testUnknownOrientationIsUp", testUnknownOrientationIsUp)
    ]
}
