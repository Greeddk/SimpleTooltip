import XCTest
import SwiftUI
@testable import SimpleTooltip

@available(iOS 14.0, *)
final class ToolTipTests: XCTestCase {
    
    func testToolTipCreation() {
        let text = "Test Tooltip"
        let isShowing = true
        let options = TooltipOptions(backgroundColor: .blue, textColor: .white, position: .topCenter)
        
        let button = Button("Test") {}
        let tooltipView = button.tooltip(text, isShowing: isShowing, options: options)
        
        XCTAssertNotNil(tooltipView)
    }
    
    func testToolTipOptions() {
        let text = "Test Tooltip"
        let isShowing = true
        let initialOptions = TooltipOptions()
        
        let button = Button("Test") {}
        let tooltipView = button.tooltip(text, isShowing: isShowing, options: initialOptions)
            .tooltipBackgroundColor(.red)
            .tooltipTextColor(.green)
            .tooltipAlignment(.bottomLeft)
            .tooltipOffset(CGSize(width: 10, height: 10))
            .tooltipZIndex(5)
        
        let container = tooltipView as TooltipModifierContainer<Button<Text>>
        XCTAssertEqual(container.options.backgroundColor, .red)
        XCTAssertEqual(container.options.textColor, .green)
        XCTAssertEqual(container.options.position, .bottomLeft)
        XCTAssertEqual(container.options.offset, CGSize(width: 10, height: 10))
        XCTAssertEqual(container.options.zIndex, 5)
    }
    
    func testToolTipVisibility() {
        let expectation = XCTestExpectation(description: "Tooltip visibility toggled")
        expectation.expectedFulfillmentCount = 3
        
        var visibilityChanges: [Bool] = []
        var toggleResults: [Bool] = []
        
        let view = TestView { isVisible in
            visibilityChanges.append(isVisible)
            expectation.fulfill()
        }
        
        let hostingController = UIHostingController(rootView: view)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        DispatchQueue.main.async {
            view.checkTooltipVisibility()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let result = view.toggleTooltip()
            toggleResults.append(result)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let result = view.toggleTooltip()
            toggleResults.append(result)
        }
        
        wait(for: [expectation], timeout: 2.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(visibilityChanges, [false, true, false], "Tooltip visibility should change from false to true, then back to false")
            XCTAssertEqual(toggleResults, [true, false], "Toggle results should be true then false")
            expectation.fulfill()
        }
    }
}

@available(iOS 14.0, *)
struct TestView: View {
    @State private var isTooltipVisible = false
    var onVisibilityChanged: (Bool) -> Void
    
    var body: some View {
        Button("Test") {
            _ = toggleTooltip()
        }
        .tooltip("Test Tooltip", isShowing: isTooltipVisible)
    }
    
    func toggleTooltip() -> Bool {
        isTooltipVisible.toggle()
        onVisibilityChanged(isTooltipVisible)
        return isTooltipVisible
    }
    
    func checkTooltipVisibility() {
        onVisibilityChanged(isTooltipVisible)
    }
}
