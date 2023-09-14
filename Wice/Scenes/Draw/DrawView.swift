//
//  DrawView.swift
//  Wice
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/23.
//

import SwiftUI
import PencilKit

struct DrawView: View {
    @Environment(\.undoManager) private var undoManager
    @State private var canvasView = PKCanvasView()
    
    @State private var drawingSize: CGSize = CGSize()
    @State private var image: UIImage?
    
    private var watchOSConnector = WatchOSConnector()
    
    var body: some View {
        VStack {
            Spacer(minLength: 45)
            
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    
                    Button{
                        drawingSize = canvasView.visibleSize
                        
                        let imgRect = CGRect(origin: CGPoint.zero, size: drawingSize)
                        image = canvasView.drawing.image(from: imgRect, scale: 1.0)
                        
                        if let uiImage = image {
                            self.sendMessageToWatch(image: uiImage)
                        }
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button{
                        canvasView.drawing = PKDrawing()
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button{
                        undoManager?.undo()
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button{
                        undoManager?.redo()
                    } label: {
                        Image(systemName: "arrow.uturn.forward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    
                    Spacer()
                }
                .background(Color.orange)
                .padding()
                .shadow(radius: 8)
                .fixedSize()
                
                CanvasView(canvasView: $canvasView)
                    .padding()
                    .frame(minWidth: 250, idealWidth: 350, maxWidth: 400, minHeight: 250, idealHeight: 350, maxHeight: 400, alignment: .center)
                    .shadow(radius: 8)
                
                Spacer(minLength: 80)
            }
        }
    }
}

// MARK: - Functions
extension DrawView {
    func sendMessageToWatch(image: UIImage) {
        if watchOSConnector.session.isReachable {
            if let compressedData = compressImage(image) {
                watchOSConnector.session.sendMessage(["image": compressedData], replyHandler: nil, errorHandler: { error in
                    print("Erro ao enviar a imagem para o Apple Watch: \(error.localizedDescription)")
                })
            }
        } else {
            print("Apple Watch não disponível.")
        }
        
        
    }
    
    func compressImage(_ image: UIImage, compressionQuality: CGFloat = 0.3) -> Data? {
        return image.jpegData(compressionQuality: compressionQuality)
    }
}

#Preview {
    DrawView()
}
