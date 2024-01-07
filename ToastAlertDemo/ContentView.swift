//
//  ContentView.swift
//  ToastAlertDemo
//
//  Created by Terry Kuo on 2024/1/7.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowAlert: Bool = false
    @State private var symbol: String = "⚠️ "
    @State private var bgColor: Color = .red
    @State private var message: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    self.symbol = ""
                    self.message = "Success"
                    self.bgColor = .green
                    showAlertWithMessage()
                } label: {
                    Text("Show success")
                }
                
                Button {
                    self.symbol = "⚠️ "
                    self.bgColor = .red
                    self.message = "Failed"
                    showAlertWithMessage()
                } label: {
                    Text("Show Failed")
                }
                .foregroundStyle(.red)
                .padding()
                
            }
            .padding()
            .navigationTitle("Toast Demo")
        }
        .overlay {
            if isShowAlert {
                ToastAlertView(symbol: symbol, bgColor: bgColor, message: message ?? "message")
            }
        }
    }
    
    private func showAlertWithMessage() {
        withAnimation(.snappy) {
            self.isShowAlert = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.snappy) {
                self.isShowAlert = false
            }
        }
    }
}

#Preview {
    ContentView()
}
