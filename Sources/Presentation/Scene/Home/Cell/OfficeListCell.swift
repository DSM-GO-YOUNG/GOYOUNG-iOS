import SwiftUI

struct OfficeListCell: View {
    let company: CompanyEntity

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 20) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 140, height: 130)
                    .background(Color.gray)

                VStack(alignment: .leading, spacing: 0) {
                    Text(company.name)
                        .font(.suseongBatang(16))
                        .padding(.bottom, 5)
                    Text(company.explanation)
                        .font(.suseongBatang(12))
                        .foregroundColor(.gray100)
                        .padding(.bottom, 21)
                    Text(company.kind)
                        .font(.suseongBatang(14))
                        .foregroundColor(.gray200)
                    Text(company.address)
                        .font(.suseongBatang(12))
                        .foregroundColor(.gray100)
                }
            }
            .frame(height: 130)
            .padding(.bottom, 23)

            Color.mainGreen.frame(height: 1)
        }
        .padding(.horizontal, 16)
    }
}
