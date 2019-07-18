import XCTest
@testable import PetFocus

final class PetFocusedImageViewTests: XCTestCase {
    private class MockPetFocusedImageView: PetFocusedImageView {
        override var cropsToPets: Bool {
            get { return false }
            set { }
        }

        var imageSetExpectation: XCTestExpectation?

        override func setImage(from originalImage: UIImage) {
            imageSetExpectation?.fulfill()
            super.setImage(from: originalImage)
        }
    }

    func testAwakeFromNibResetsImage() {
        let imageView = MockPetFocusedImageView()
        imageView.image = UIImage()

        imageView.imageSetExpectation = expectation(description: "image was set")

        imageView.awakeFromNib()
        waitForExpectations(timeout: 1)
    }

    func testAwakeFromNibDoesNotResetNilImage() {
        let imageView = MockPetFocusedImageView()
        imageView.image = nil

        imageView.imageSetExpectation = expectation(description: "image was set")
        imageView.imageSetExpectation?.isInverted = true

        imageView.awakeFromNib()
        waitForExpectations(timeout: 0.1)
    }

    func testSettingImagePropertyResetsImage() {
        let imageView = MockPetFocusedImageView()
        imageView.imageSetExpectation = expectation(description: "image was set")

        imageView.image = UIImage()
        waitForExpectations(timeout: 1)
    }

    func testSettingImagePropertyToNilDoesNotResetImage() {
        let imageView = MockPetFocusedImageView()
        imageView.imageSetExpectation = expectation(description: "image was set")
        imageView.imageSetExpectation?.isInverted = true

        imageView.image = nil
        waitForExpectations(timeout: 0.01)
    }

    static var allTests = [
        ("testAwakeFromNibResetsImage", testAwakeFromNibResetsImage),
        ("testAwakeFromNibDoesNotResetNilImage", testAwakeFromNibDoesNotResetNilImage),
        ("testSettingImagePropertyResetsImage", testSettingImagePropertyResetsImage),
        ("testSettingImagePropertyToNilDoesNotResetImage", testSettingImagePropertyToNilDoesNotResetImage)
    ]
}
