//
//  TooltipOptions.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

@available(iOS 14.0, *)
struct TooltipOptions {
    var backgroundColor: Color = .white
    var textColor: Color = .black
    var position: TrianglePosition = .topCenter
    var offset: CGSize = .zero
    var zIndex: Double = 1
}
