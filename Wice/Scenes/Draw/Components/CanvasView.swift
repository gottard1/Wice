//
//  CanvasView.swift
//  Wice
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/23.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    @State var toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        
        showToolPicker()
        
        return canvasView
    }
    
    func updateUIView(_ canvasView: PKCanvasView, context: Context) { }
    
    func showToolPicker() {
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
      }
}
