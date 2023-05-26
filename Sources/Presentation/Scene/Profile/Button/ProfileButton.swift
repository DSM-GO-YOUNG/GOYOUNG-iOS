import SwiftUI

struct ProfileButton<Destination>: View where Destination: View {
    let image: Image
    let title: String
    let destination: () -> Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                image
                    .resizable()
                    .frame(width: 28, height: 28)
                Spacer()
                Text(title)
                    .font(.suseongBatang(18))
                    .foregroundColor(.black)
                Spacer()
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray100)
            }
            .padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.line, lineWidth: 1)
            )
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(image: .logo, title: "모집 공고 작성", destination: { Text("!!!!") })
    }
}
