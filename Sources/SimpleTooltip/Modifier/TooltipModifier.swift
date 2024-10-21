//
//  TooltipModifier.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

@available(iOS 14.0, *)
struct TooltipModifier: ViewModifier {
    let text: String
    let isShowing: Bool
    var options: TooltipOptions
    @State private var size: CGSize = .zero
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isShowing {
                        GeometryReader { geometry in
                            TooltipView(text: text, backgroundColor: options.backgroundColor, textColor: options.textColor, position: options.position, maxWidth: getMaxWidth(geometry))
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
    
    private func getMaxWidth(_ geometry: GeometryProxy) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let viewFrame = geometry.frame(in: .global)
        let leftSpace = viewFrame.minX
        let rightSpace = screenWidth - viewFrame.maxX
        
        switch options.position {
        case .topLeft, .bottomLeft:
            return min(screenWidth - leftSpace - 20, 300)
        case .topRight, .bottomRight:
            return min(screenWidth - rightSpace - 20, 300)
        case .topCenter, .bottomCenter:
            return min(screenWidth - 40, 300)
        }
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
}
