import Foundation

public func isValidURL(_ urlString: String) throws {
    guard let url = URL(string: urlString) else {
        print("Invalid URL string: '\(urlString)")
        throw endPointError.invalidUrl
    }
    
    guard url.scheme == "https" else {
        print(">>>>>>>> URL '\(urlString)' has an invalid scheme")
        throw endPointError.invalidScheme
    }
    
    guard url.fragment == nil else {
        print(">>>>>>>> URL '\(urlString)' contains a fragment")
        throw endPointError.invalidFragment
    }
    
    print(">>>>>>>> URL '\(urlString)' is valid")
}


enum endPointError: String,Error{
    case invalidUrl =  "Invalid URL string"
    case invalidScheme = "Invalid Scheme"
    case invalidFragment = "Invalid fragment"
}
