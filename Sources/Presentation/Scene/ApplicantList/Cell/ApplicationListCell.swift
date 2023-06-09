import SwiftUI

struct ApplicationListCell: View {
    let applicationEntity: ApplicationEntity

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                AsyncImage(url: URL(string: applicationEntity.id)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                } placeholder: {
                    Color.gray50
                        .frame(width: 130, height: 130)
                }
                .padding(.trailing, 12)
                VStack(alignment: .leading, spacing: 0) {
                    Text("이름 : \(applicationEntity.id)")
                    Text("나이 : 67세")
                    Text("주소 : 강아지 멍멍구")
                    Spacer()
                        .frame(height: 10)
                    Text("한 줄 소개")
                    Text(applicationEntity.content)
                        .lineLimit(2)
                }
                .font(.suseongBatang(16))
                Spacer()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            Color.deepPink
                .frame(height: 1)
        }
    }
}
