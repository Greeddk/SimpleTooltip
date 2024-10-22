//
//  View+.swift
//  SimpleTooltip
//
//  Created by Dong Guk Lee on 10/21/24.
//

import SwiftUI

@available(iOS 14.0, *)
public extension View {
    func measureSize(perform action: @escaping (CGSize) -> Void) -> some View {
        self.overlay(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        action(geometry.size)
                    }
                    .onChange(of: geometry.size) { newSize in
                        action(newSize)
                    }
            }
        )
    }
    
    func tooltip(_ text: String, isShowing: Bool) -> TooltipContainer<Self> {
        TooltipContainer(content: self, text: text, isShowing: isShowing)
    }
}
