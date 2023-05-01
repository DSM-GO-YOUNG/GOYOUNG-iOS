import SwiftUI

struct OfficeListCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 20) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 140, height: 130)
                    .background(Color.gray)

                VStack(alignment: .leading, spacing: 0) {
                    Text("회사명")
                        .font(.suseongBatang(16))
                        .padding(.bottom, 5)
                    Text("어떤 어떤 무슨 일을 하는 사람입니다.")
                        .font(.suseongBatang(12))
                        .foregroundColor(.gray100)
                        .padding(.bottom, 21)
                    Text("주 5회(평일)")
                        .font(.suseongBatang(14))
                        .foregroundColor(.gray200)
                    Text("하는일 하는일 하는일")
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

struct OfficeListCell_Previews: PreviewProvider {
    static var previews: some View {
        OfficeListCell()
    }
}
