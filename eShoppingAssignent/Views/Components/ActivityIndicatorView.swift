//
//  ActivityIndicatorView.swift
//  Activity
//
//  Created by Shriram Kadam on 14/12/22.
//
import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    @Binding var animating: Bool
    let style: UIActivityIndicatorView.Style
    
  public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        return indicator
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        animating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

