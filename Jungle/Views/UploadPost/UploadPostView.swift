
import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var selectedTab: String
    @ObservedObject var viewModel = UploadPostViewModel()
   
    var body: some View {
 
        VStack {
            if postImage == nil {
                Button(action: {imagePickerPresented.toggle() }, label: {
                    HStack {
                         
                        Text("Upload Photo \(Image(systemName: "photo"))")
                        
                            .font(.system(size: 16, weight:
                                    .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                                    

                                
                            
                    }
                            .foregroundColor((Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                            .padding(.top, 56)
                    
                        
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                    
                })
            } else if let image = postImage{
                HStack(alignment: .top) {
                   image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()

                 TextArea(text: $captionText, placeholder: "Enter Your Caption...")
                        .frame(height: 200)
                        .border(Color.gray)
                    
                    
                }.padding()
                
                HStack(spacing: 16) {
                    Button(action: {
                        captionText = ""
                        postImage = nil
                       
                    }, label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight:
                                    .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    })
                    
                    Button(action: {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) {_ in
                                captionText = ""
                                postImage = nil
                                selectedTab = "house.fill"
                                
                            }
                    }
                    }, label: {
                        Text("Post")
                            .font(.system(size: 16, weight:
                                    .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    })
                }.padding()
            }
            
            
            Spacer()
        }
       
    }
}


extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

