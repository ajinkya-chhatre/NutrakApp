//
//  CameraView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 07/02/25.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var navigateToScanning: Bool

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView

        init(parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            picker.dismiss(animated: true) {
                DispatchQueue.main.async {
                    self.parent.isPresented = false
                    self.parent.navigateToScanning = true // Now correctly opens ScanningScreen first
                }
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}



