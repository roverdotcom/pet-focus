import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CGGeometryTests.allTests),
        testCase(PetDetectionOperationTests.allTests),
        testCase(PetFocusedImageCropperTests.allTests),
        testCase(PetFocusedImageViewTests.allTests),
        testCase(PetObservationTests.allTests),
        testCase(UIImageExtensionsTests.allTests)
    ]
}
#endif
