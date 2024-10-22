# SimpleTooltip

A lightweight, customizable tooltip library for SwiftUI. Easily add tooltips to any SwiftUI view with customizable arrow positions, colors, and animations.

![Minimum iOS Version](https://img.shields.io/badge/iOS-14.0%2B-blue)
![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen)

<img src="https://github.com/user-attachments/assets/59957e64-315c-485e-b876-ab34af70239b" width="300" />
<img src="https://github.com/user-attachments/assets/b63d98a4-d7eb-4a71-a2fc-d42bf8970815" width="300" />
<img src="https://github.com/user-attachments/assets/3efb807f-d434-4fa9-a5fd-d14aee12f540" width="300" />


## Features

- 🎯 Easy to implement
- 📐 Multiple arrow positions
- 💪 Written in pure SwiftUI
- 🔄 Supports dynamic content sizing

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/SimpleTooltip.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File > Add Packages...
2. Enter package URL: `https://github.com/yourusername/SimpleTooltip.git`
3. Select version requirements
4. Click Add Package

## Usage

### Basic Implementation

```swift
import SimpleTooltip

struct ContentView: View {
    @State private var showTooltip = false
    
    var body: some View {
        Button("Tap me") {
            showTooltip.toggle()
        }
        .tooltip("This is a tooltip", isShowing: showTooltip)
    }
}
```

### Customization Options

```swift
Button("Customized Tooltip") {
    showTooltip.toggle()
}
.tooltip("Custom styled tooltip", isShowing: showTooltip)
.tooltipBackgroundColor(.blue)
.tooltipTextColor(.white)
.tooltipArrowPosition(.topCenter)
.tooltipOffset(CGSize(width: 0, height: 10))
.tooltipZIndex(1)
```

### Arrow Positions

You can position the tooltip's arrow in six different locations:

```swift
// Arrow at the top of the tooltip
.tooltipArrowPosition(.topLeft)     // Arrow points up from top-left
.tooltipArrowPosition(.topCenter)   // Arrow points up from top-center
.tooltipArrowPosition(.topRight)    // Arrow points up from top-right

// Arrow at the bottom of the tooltip
.tooltipArrowPosition(.bottomLeft)   // Arrow points down from bottom-left
.tooltipArrowPosition(.bottomCenter) // Arrow points down from bottom-center
.tooltipArrowPosition(.bottomRight)  // Arrow points down from bottom-right
```

## API Reference

### Customization Methods

| Method | Description | Default Value |
|--------|-------------|---------------|
| `tooltipBackgroundColor(_ color: Color)` | Sets the background color of the tooltip | `.white` |
| `tooltipTextColor(_ color: Color)` | Sets the text color of the tooltip | `.black` |
| `tooltipArrowPosition(_ position: TrianglePosition)` | Sets the position of the tooltip's arrow | `.topCenter` |
| `tooltipOffset(_ offset: CGSize)` | Adds offset to the tooltip position | `.zero` |
| `tooltipZIndex(_ zIndex: Double)` | Sets the z-index of the tooltip | `1` |

## Example

Here's a complete example showing different tooltip arrow positions:

```swift
struct TooltipDemo: View {
    @State private var showTooltip1 = false
    @State private var showTooltip2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Tooltip with arrow pointing up from the top
            Button("Top Arrow") {
                showTooltip1.toggle()
            }
            .tooltip("Arrow points upward", 
                    isShowing: showTooltip1)
            .tooltipArrowPosition(.topCenter)
            
            // Tooltip with arrow pointing down from the bottom
            Button("Bottom Arrow (Custom)") {
                showTooltip2.toggle()
            }
            .tooltip("Custom styled tooltip", 
                    isShowing: showTooltip2)
            .tooltipBackgroundColor(.blue)
            .tooltipTextColor(.white)
            .tooltipArrowPosition(.bottomRight)
        }
    }
}
```

## Requirements

- iOS 14.0 or later
- Swift 5.3 or later
- Xcode 12.0 or later

## License

SimpleTooltip is available under the MIT license. See the LICENSE file for more info.
