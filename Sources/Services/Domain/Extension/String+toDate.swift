import Foundation

enum DateFormat: String {
    /// yyyy-MM-dd'T'HH:mm:ss.SSSS
    case fullDateWithMilliSecondTime = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
    /// yyyy-MM-dd'T'HH:mm:ss
    case fullDateWithTime = "yyyy-MM-dd'T'HH:mm:ss"
    /// yyyy-MM-dd
    case fullDate = "yyyy-MM-dd"
}

extension String {
    func toDate(format: DateFormat) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: self) ?? Date()
    }
}
