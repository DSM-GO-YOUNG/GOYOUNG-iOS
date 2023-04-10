import SwiftUI

struct GFillNavigationLink<Destination>: View where Destination: View {
    let title: String
    let destination: () -> Destination
    let backgroundColor: Color
    let textColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat

    init(
        title: String,
        destination: @escaping () -> Destination,
        backgroundColor: Color = .mainGreen,
        textColor: Color = .white,
        borderColor: Color = .clear,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 50
    ) {
        self.title = title
        self.destination = destination
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Spacer()
                Text(title)
                    .font(.suseongBatang(22))
                    .foregroundColor(textColor)
                Spacer()
            }
            .frame(height: 71)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
    }
}

struct GFillNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        GFillNavigationLink(title: "로그인", destination: { Text("!!!") })
    }
}
