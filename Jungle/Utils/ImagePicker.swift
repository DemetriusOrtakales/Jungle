

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeUIViewController(context: Context) ->  UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
        
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        let parent: ImagePicker
        
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[.originalImage] as? UIImage else {return}
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss()
            
        }
        
    }
}

