import SwiftUI

struct GSearchBar: View {
    let text: Binding<String>
    let action: () -> Void

    var body: some View {
        HStack {
            TextField("검색어를 입력하세요!", text: text)
                .font(.suseongBatang(14))

            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.deepPink)
                    .frame(width: 17, height: 17)
            }
        }
        .padding(.horizontal, 19)
        .frame(height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.mainPink, lineWidth: 1)
        )
        .padding(.top, 10)
    }
}

struct GSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        GSearchBar(text: .constant(""), action: { })
    }
}
