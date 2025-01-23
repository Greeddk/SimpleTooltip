//
//  TooltipModifierContainer.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct TooltipContainer<Content: View>: View {
    let content: Content
    let text: String
    let isShowing: Bool
    var options: TooltipOptions
    @State private var size: CGSize = .zero
    
    public init(content: Content, text: String, isShowing: Bool) {
        self.content = content
        self.text = text
        self.isShowing = isShowing
        self.options = TooltipOptions()
    }
    
    public var body: some View {
        content
            .overlay(
                Group {
                    if isShowing {
                        GeometryReader { geometry in
                            TooltipView(
                                text: text,
                                backgroundColor: options.backgroundColor,
                                textColor: options.textColor,
                                position: options.position
                            )
                            .fixedSize()
                            .measureSize { size = $0 }
                            .position(getToolTipPosition(geometry))
                            .offset(options.offset)
                        }
                    }
                }
            )
            .zIndex(options.zIndex)
    }
    
    private func getToolTipPosition(_ geometry: GeometryProxy) -> CGPoint {
        let viewWidth = geometry.size.width
        let viewHeight = geometry.size.height
        
        switch options.position {
        case .bottomLeft:
            return CGPoint(x: size.width / 2, y: -size.height / 2 - 5)
        case .bottomRight:
            return CGPoint(x: viewWidth - size.width / 2, y: -size.height / 2 - 5)
        case .bottomCenter:
            return CGPoint(x: viewWidth / 2, y: -size.height / 2 - 5)
        case .topLeft:
            return CGPoint(x: size.width / 2, y: viewHeight + size.height / 2 + 5)
        case .topRight:
            return CGPoint(x: viewWidth - size.width / 2, y: viewHeight + size.height / 2 + 5)
        case .topCenter:
            return CGPoint(x: viewWidth / 2, y: viewHeight + size.height / 2 + 5)
        }
    }
    
    public func tooltipBackgroundColor(_ color: Color) -> TooltipContainer {
        var newContainer = self
        newContainer.options.backgroundColor = color
        return newContainer
    }
    
    public func tooltipTextColor(_ color: Color) -> TooltipContainer {
        var newContainer = self
        newContainer.options.textColor = color
        return newContainer
    }
    
    public func tooltipArrowPosition(_ position: TrianglePosition) -> TooltipContainer {
        var newContainer = self
        newContainer.options.position = position
        return newContainer
    }
    
    public func tooltipOffset(_ offset: CGSize) -> TooltipContainer {
        var newContainer = self
        newContainer.options.offset = offset
        return newContainer
    }
    
    public func tooltipZIndex(_ zIndex: Double) -> TooltipContainer {
        var newContainer = self
        newContainer.options.zIndex = zIndex
        return newContainer
    }
}
