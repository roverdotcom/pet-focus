import XCTest
@testable import PetFocus

@available(iOS 13.0, *)
final class PetFocusedImageCropperTests: XCTestCase {
    private let squareAspectRatio = CGSize(width: 1, height: 1)

    private class MockResizableImage: UIImage {
        var overrideScale = CGFloat(1)
        var overrideSize = CGSize.zero

        override var scale: CGFloat { return overrideScale }
        override var size: CGSize { return overrideSize }
    }

    func testCroppingWithNoObservations() {
        let image = UIImage()
        let imageCropper = PetFocusedImageCropper()
        let finalImage = imageCropper.croppedImage(from: image, aspectRatio: squareAspectRatio, observations: [])

        XCTAssert(image === finalImage)
    }

    func testCroppingImageWithExistingObservations() {
        let image = MockResizableImage()
        image.overrideSize = CGSize(width: 4592, height: 3056)

        let observation = PetObservation(bounds: CGRect(x: 283.0, y: 746.0, width: 1703.0, height: 1321.0), uuid: UUID())

        let finalImage = PetFocusedImageCropper().croppedImage(from: image, aspectRatio: squareAspectRatio, observations: [observation])
        let expectedSize = CGSize(width: 3056, height: 3056)

        XCTAssertEqual(finalImage.size, expectedSize)
    }

    static var allTests = [
        ("testCroppingWithNoObservations", testCroppingWithNoObservations),
        ("testCroppingImageWithExistingObservations", testCroppingImageWithExistingObservations)
    ]
}
