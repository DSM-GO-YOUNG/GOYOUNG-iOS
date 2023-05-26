import SwiftUI

struct ImageView: View {
    var imageUrl: URL?
    @Binding var uiimage: UIImage

    var body: some View {
        if uiimage == UIImage() {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray50
            }
            .frame(width: 194, height: 194)
        } else {
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFill()
                .frame(width: 194, height: 194)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: nil, uiimage: .constant(.init()))
    }
}
