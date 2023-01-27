internal enum Descriptor: UInt8, Equatable, Hashable, CustomStringConvertible {
    case device = 0x01
    case config = 0x02
    case string = 0x03
    case interface = 0x04
    case endpoint = 0x05
    case bos = 0x0f
    case capability = 0x10 //deviceCapability
    case hid = 0x21
    case report = 0x22
    case physical = 0x23
    case hub = 0x29
    case superspeed = 0x2a //superspeedHub
    case companion = 0x30 //ssEndpointCompanion
    
    public var description: String {
        switch self {
        case .device: return "device"
        case .config: return "config"
        case .string: return "string"
        case .interface: return "interface"
        case .endpoint: return "endpoint"
        case .bos: return "bos"
        case .capability: return "device capability"
        case .hid: return "hid"
        case .report: return "report"
        case .physical: return "physical"
        case .hub: return "hub"
        case .superspeed: return "superspeed hub"
        case .companion: return "ss endpoint companion"
        }
    }
}
