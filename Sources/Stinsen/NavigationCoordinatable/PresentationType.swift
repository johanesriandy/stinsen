import Foundation
import SwiftUI

public enum PresentationType {
    case modal
    case push
    @available(iOS 14, tvOS 14, watchOS 7, *)
    case fullScreen
    
    public var isModal: Bool {
        switch self {
        case .modal:
            return true
        default:
            return false
        }
    }
    
    public var isPush: Bool {
        switch self {
        case .push:
            return true
        default:
            return false
        }
    }
    
    @available(iOS 14, tvOS 14, watchOS 7, *)
    public var isFullScreen: Bool {
        switch self {
        case .fullScreen:
            return true
        default:
            return false
        }
    }
}
