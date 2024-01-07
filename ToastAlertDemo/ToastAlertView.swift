//
//  ToastAlertView.swift
//  abccar
//
//  Created by Terry Kuo on 2023/12/28.
//

import SwiftUI

struct ToastAlertView: View {
    var symbol: String = "⚠️ "
    var bgColor: Color = .red
    let message: String
    @State private var isAnimating: Bool = false
    
    var body: some View {
        Text("\(symbol)" + (message))
            .font(.system(.body, design: .rounded, weight: .semibold))
            .foregroundStyle(.white)
            .scaleEffect(isAnimating ? 1 : 0.001)
            .padding(16)
            .padding(.horizontal)
            .background (bgColor.cornerRadius(20))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.7), lineWidth: 2)
                    .shadow(radius: 2)
            })
            
            .padding(.bottom)
            .shadow(color: bgColor, radius: 1)
            .transition(.move(edge: .bottom))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                        self.isAnimating = true
                    }
                }
            }
    }
}

#Preview {
    VStack {
        ToastAlertView(symbol: "", bgColor: .green, message: "Success")
        ToastAlertView(message: "Failed!")
    }
}
