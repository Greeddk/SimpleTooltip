//
//  TooltipOptions.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct TooltipOptions {
    public var backgroundColor: Color = .white
    public var textColor: Color = .black
    public var position: TrianglePosition = .topCenter
    public var offset: CGSize = .zero
    public var zIndex: Double = 1
    
    public init() {}
}
