public enum Speed: UInt8, Equatable, Hashable, CustomStringConvertible {
    case unknown = 0x00
    case low = 0x01
    case full = 0x02
    case high =  0x04
    case `super` = 0x08
    case plus = 0x10
    
    public var description: String {
        switch self {
        case .unknown: return "unknown"
        case .low: return "1.5MBit/s"
        case .full: return "12MBit/s"
        case .high: return "480MBit/s"
        case .super: return "5000MBit/s"
        case .plus: return "10000MBit/s"
        }
    }
}
