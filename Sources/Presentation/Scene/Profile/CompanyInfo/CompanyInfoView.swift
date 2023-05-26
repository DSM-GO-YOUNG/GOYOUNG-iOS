import SwiftUI

struct CompanyInfoView: View {
    let company: CompanyEntity?
    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .center) {
                Text("회사명")
                    .font(.suseongBatang(20))
                Spacer()
                Text(company?.name ?? "")
                    .foregroundColor(.gray100)
                    .font(.suseongBatang(18))
            }
            HStack(alignment: .center) {
                Text("업종")
                    .font(.suseongBatang(20))
                Spacer()
                Text(company?.kind ?? "")
                    .foregroundColor(.gray100)
                    .font(.suseongBatang(18))
            }
            HStack(alignment: .center) {
                Text("주소")
                    .font(.suseongBatang(20))
                Spacer()
                Text(company?.address ?? "")
                    .foregroundColor(.gray100)
                    .font(.suseongBatang(18))
            }
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.deepPink, lineWidth: 1)
        )
    }
}
