//
//  TooltipModifierContainer.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct TooltipModifierContainer<Content: View>: View {
    let content: Content
    let text: String
    let isShowing: Bool
    var options: TooltipOptions
    
    public init(content: Content, text: String, isShowing: Bool, options: TooltipOptions = TooltipOptions()) {
        self.content = content
        self.text = text
        self.isShowing = isShowing
        self.options = options
    }
    
    public var body: some View {
        content.modifier(TooltipModifier(text: text, isShowing: isShowing, options: options))
    }
    
    public func tooltipBackgroundColor(_ color: Color) -> TooltipModifierContainer {
        var newContainer = self
        newContainer.options.backgroundColor = color
        return newContainer
    }
    
    public func tooltipTextColor(_ color: Color) -> TooltipModifierContainer {
        var newContainer = self
        newContainer.options.textColor = color
        return newContainer
    }
    
    public func tooltipAlignment(_ position: TrianglePosition) -> TooltipModifierContainer {
        var newContainer = self
        newContainer.options.position = position
        return newContainer
    }
    
    public func tooltipOffset(_ offset: CGSize) -> TooltipModifierContainer {
        var newContainer = self
        newContainer.options.offset = offset
        return newContainer
    }
    
    public func tooltipZIndex(_ zIndex: Double) -> TooltipModifierContainer {
        var newContainer = self
        newContainer.options.zIndex = zIndex
        return newContainer
    }
}
