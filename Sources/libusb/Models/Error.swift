public enum Error: Int32, Swift.Error, Equatable, Hashable, CustomStringConvertible { //libusb_error
    case success = 0 //LIBUSB_SUCCESS
    case io = -1 //LIBUSB_ERROR_IO
    case invalidParam = -2 //LIBUSB_ERROR_INVALID_PARAM
    case access = -3 //LIBUSB_ERROR_ACCESS
    case noDevice = -4 //LIBUSB_ERROR_NO_DEVICE
    case notFound = -5 //LIBUSB_ERROR_NOT_FOUND
    case busy = -6 //LIBUSB_ERROR_BUSY
    case timeout = -7 //LIBUSB_ERROR_TIMEOUT
    case overflow = -8 //LIBUSB_ERROR_OVERFLOW
    case pipe = -9 //LIBUSB_ERROR_PIPE
    case interrrupted = -10 //LIBUSB_ERROR_INTERRUPTED
    case noMem = -11 //LIBUSB_ERROR_NO_MEM
    case notSupported = -12 //LIBUSB_ERROR_NOT_SUPPORTED
    case other = -99 //LIBUSB_ERROR_OTHER
    
    public var description: String {
        switch self {
        case .success: return "success"
        case .io: return "Input/output error"
        case .invalidParam: return "Invalid parameter"
        case .access: return "Access denied"
        case .noDevice: return "No such device"
        case .notFound: return "Entity not found"
        case .busy: return "Resource busy"
        case .timeout: return "Operation timed out"
        case .overflow: return "Overflow"
        case .pipe: return "Pipe error"
        case .interrrupted: return "System call interrupted"
        case .noMem: return "Insufficient memory"
        case .notSupported: return "Operation not supported or unimplemented on this platform"
        case .other: return "Other error"
        }
    }
}
