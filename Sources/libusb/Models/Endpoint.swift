public struct Endpoint: Equatable, Hashable, CustomStringConvertible {
    public var type: Transfer
    public var sync: Sync
    public var usage: Usage?
    public var address: UInt8
    public var size: UInt16
    
    public var description: String {
        "Endpoint(type: \(type), sync: \(sync), usage: \(usage?.description ?? "nil"), address: \(address), size: \(size))"
    }
}

extension Endpoint {
    public var direction: Direction? {
        Direction(rawValue: address & 0b01000000)
    }
}

public enum Direction: UInt8, Equatable, Hashable, CustomStringConvertible {
    case `in` = 0x00
    case out = 0x80
    
    public var description: String {
        switch self {
        case .in: return "in"
        case .out: return "in"
        }
    }
}

public enum Transfer: UInt8, Equatable, Hashable, CustomStringConvertible {
    case control = 0x00
    case isochronous = 0x01
    case bulk = 0x02
    case interrupt = 0x03
    
    public var description: String {
        switch self {
        case .control: return "control"
        case .isochronous: return "isochronous"
        case .bulk: return "bulk"
        case .interrupt: return "interrupt"
        }
    }
}

public enum Sync: UInt8, Equatable, Hashable, CustomStringConvertible {
    case `none` = 0x00
    case `async` = 0x01
    case adaptive = 0x03
    case sync = 0x04
    
    public var description: String {
        switch self {
        case .none: return "none"
        case .async: return "async"
        case .adaptive: return "adaptive"
        case .sync: return "sync"
        }
    }
}

public enum Usage: UInt8, Equatable, Hashable, CustomStringConvertible {
    case data = 0x00
    case feedback = 0x01
    case implict = 0x02
    case reserved = 0x03
    
    public var description: String {
        switch self {
        case .data: return "data"
        case .feedback: return "feedback"
        case .implict: return "implict"
        case .reserved: return "reserved"
        }
    }
}
