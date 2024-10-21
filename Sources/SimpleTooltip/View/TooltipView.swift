//
//  ToolTipView.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

enum TrianglePosition {
    case topLeft
    case topRight
    case topCenter
    case bottomLeft
    case bottomRight
    case bottomCenter
}

@available(iOS 14.0, *)
struct TooltipView: View {
    let text: String
    let backgroundColor: Color
    let textColor: Color
    let position: TrianglePosition
    let maxWidth: CGFloat
    
    var body: some View {
        VStack(alignment: horizontalAlignment, spacing: -6) {
            if position == .bottomLeft || position == .bottomRight || position == .bottomCenter {
                tooltipContent
                tooltipTriangle
            } else {
                tooltipTriangle
                tooltipContent
            }
        }
    }
    
    private var horizontalAlignment: HorizontalAlignment {
        switch position {
        case .topLeft, .bottomLeft:
            return .leading
        case .topRight, .bottomRight:
            return .trailing
        case .topCenter, .bottomCenter:
            return .center
        }
    }
    
    private var tooltipContent: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .foregroundColor(textColor)
            .font(.system(size: 14, weight: .semibold))
            .padding(8)
            .frame(maxWidth: maxWidth)
            .background(backgroundColor)
            .cornerRadius(8)
    }
    
    private var tooltipTriangle: some View {
        Triangle(pointingUp: position == .topLeft || position == .topRight || position == .topCenter)
            .fill(backgroundColor)
            .frame(width: 20, height: 15)
            .padding(.leading, horizontalAlignment == .leading ? 10 : 0)
            .padding(.trailing, horizontalAlignment == .trailing ? 10 : 0)
    }
}

@available(iOS 14.0, *)
struct Triangle: Shape {
    var pointingUp: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        if pointingUp {
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
        path.closeSubpath()
        return path
    }
}
