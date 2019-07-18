import XCTest
@testable import PetFocus

final class CGGeometryExtensionsTests: XCTestCase {
    func testMultiplyingSize() {
        let originalSize = CGSize(width: 5, height: 5)
        let actualSize = originalSize * 10
        let expectedSize = CGSize(width: 50, height: 50)

        XCTAssertEqual(actualSize, expectedSize)
    }

    func testMultiplyingRect() {
        let originalRect = CGRect(x: 2, y: 2, width: 5, height: 5)
        let actualRect = originalRect * 10
        let expectedRect = CGRect(x: 20, y: 20, width: 50, height: 50)

        XCTAssertEqual(actualRect, expectedRect)
    }

    func testCreatingRectFromCenter() {
        let actualRect = CGRect(center: CGPoint(x: 10, y: 10), size: CGSize(width: 4, height: 4))
        let expectedRect = CGRect(x: 8, y: 8, width: 4, height: 4)

        XCTAssertEqual(actualRect, expectedRect)
    }

    func testGettingCenterOfRect() {
        let originalRect = CGRect(x: 8, y: 8, width: 4, height: 4)
        let actualCenter = originalRect.center
        let expectedCenter = CGPoint(x: 10, y: 10)

        XCTAssertEqual(actualCenter, expectedCenter)
    }

    func testFlippingRect() {
        let originalRect = CGRect(x: 0.2, y: 0.2, width: 0.4, height: 0.4)
        let actualRect = CGRect.flippedRect(from: originalRect, scaledTo: CGSize(width: 100, height: 100))
        let expectedRect = CGRect(x: 20, y: 40, width: 40, height: 40)

        XCTAssertEqual(actualRect, expectedRect)
    }

    static var allTests = [
        ("testMultiplyingCGSize", testMultiplyingSize),
        ("testMultiplyingRect", testMultiplyingRect),
        ("testCreatingRectFromCenter", testCreatingRectFromCenter),
        ("testGettingCenterOfRect", testGettingCenterOfRect),
        ("testFlippingRect", testFlippingRect)
    ]
}
