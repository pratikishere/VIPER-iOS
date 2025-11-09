//
//  UIKitRepresentedView.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 9/11/2025.
//

import SwiftUI

struct UIKitRepresentedView<RootView: UIViewController>: UIViewControllerRepresentable {
    let rootView: RootView
    
    func makeUIViewController(context: Context) -> RootView {
        rootView
    }
    
    func updateUIViewController(_ uiViewController: RootView, context: Context) {}
}
