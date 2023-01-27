public enum Error: Int32, Swift.Error, Equatable, Hashable, CustomStringConvertible {
    case io = -1
    case invalidParam = -2
    case access = -3
    case noDevice = -4
    case notFound = -5
    case busy = -6
    case timeout = -7
    case overflow = -8
    case pipe = -9
    case interrrupted = -10
    case noMem = -11
    case notSupported = -12
    case other = -99
    
    public var description: String {
        switch self {
        case .io: return "io"
        case .invalidParam: return "invalid param"
        case .access: return "access"
        case .noDevice: return "no device"
        case .notFound: return "not found"
        case .busy: return "busy"
        case .timeout: return "timeout"
        case .overflow: return "overflow"
        case .pipe: return "pipe"
        case .interrrupted: return "interrrupted"
        case .noMem: return "no mem"
        case .notSupported: return "not supported"
        case .other: return "other"
        }
    }
}
