import Foundation
import SwiftJWT

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

public struct MyClaims: Claims {
    let iss: String
    let iat: Date
    let exp: Date
    let aud: String
    let nonce: String
}

public func getPrivateKeyStringForVerifying() -> String {
    return """
        -----BEGIN RSA PRIVATE KEY-----
        MIICWwIBAAKBgQDdlatRjRjogo3WojgGHFHYLugdUWAY9iR3fy4arWNA1KoS8kVw
        33cJibXr8bvwUAUparCwlvdbH6dvEOfou0/gCFQsHUfQrSDv+MuSUMAe8jzKE4qW
        +jK+xQU9a03GUnKHkkle+Q0pX/g6jXZ7r1/xAK5Do2kQ+X5xK9cipRgEKwIDAQAB
        AoGAD+onAtVye4ic7VR7V50DF9bOnwRwNXrARcDhq9LWNRrRGElESYYTQ6EbatXS
        3MCyjjX2eMhu/aF5YhXBwkppwxg+EOmXeh+MzL7Zh284OuPbkglAaGhV9bb6/5Cp
        uGb1esyPbYW+Ty2PC0GSZfIXkXs76jXAu9TOBvD0ybc2YlkCQQDywg2R/7t3Q2OE
        2+yo382CLJdrlSLVROWKwb4tb2PjhY4XAwV8d1vy0RenxTB+K5Mu57uVSTHtrMK0
        GAtFr833AkEA6avx20OHo61Yela/4k5kQDtjEf1N0LfI+BcWZtxsS3jDM3i1Hp0K
        Su5rsCPb8acJo5RO26gGVrfAsDcIXKC+bQJAZZ2XIpsitLyPpuiMOvBbzPavd4gY
        6Z8KWrfYzJoI/Q9FuBo6rKwl4BFoToD7WIUS+hpkagwWiz+6zLoX1dbOZwJACmH5
        fSSjAkLRi54PKJ8TFUeOP15h9sQzydI8zJU+upvDEKZsZc/UhT/SySDOxQ4G/523
        Y0sz/OZtSWcol/UMgQJALesy++GdvoIDLfJX5GBQpuFgFenRiRDabxrE9MNUZ2aP
        FaFp+DyAe+b4nDwuJaW2LURbr8AEZga7oQj0uYxcYw==
        -----END RSA PRIVATE KEY-----
        """
}

public func getPrivateKeyStringForSigning() -> String {
    return """
    -----BEGIN RSA PRIVATE KEY-----
    MIICWwIBAAKBgQDdlatRjRjogo3WojgGHFHYLugdUWAY9iR3fy4arWNA1KoS8kVw
    33cJibXr8bvwUAUparCwlvdbH6dvEOfou0/gCFQsHUfQrSDv+MuSUMAe8jzKE4qW
    +jK+xQU9a03GUnKHkkle+Q0pX/g6jXZ7r1/xAK5Do2kQ+X5xK9cipRgEKwIDAQAB
    AoGAD+onAtVye4ic7VR7V50DF9bOnwRwNXrARcDhq9LWNRrRGElESYYTQ6EbatXS
    3MCyjjX2eMhu/aF5YhXBwkppwxg+EOmXeh+MzL7Zh284OuPbkglAaGhV9bb6/5Cp
    uGb1esyPbYW+Ty2PC0GSZfIXkXs76jXAu9TOBvD0ybc2YlkCQQDywg2R/7t3Q2OE
    2+yo382CLJdrlSLVROWKwb4tb2PjhY4XAwV8d1vy0RenxTB+K5Mu57uVSTHtrMK0
    GAtFr833AkEA6avx20OHo61Yela/4k5kQDtjEf1N0LfI+BcWZtxsS3jDM3i1Hp0K
    Su5rsCPb8acJo5RO26gGVrfAsDcIXKC+bQJAZZ2XIpsitLyPpuiMOvBbzPavd4gY
    6Z8KWrfYzJoI/Q9FuBo6rKwl4BFoToD7WIUS+hpkagwWiz+6zLoX1dbOZwJACmH5
    fSSjAkLRi54PKJ8TFUeOP15h9sQzydI8zJU+upvDEKZsZc/UhT/SySDOxQ4G/523
    Y0sz/OZtSWcol/UMgQJALesy++GdvoIDLfJX5GBQpuFgFenRiRDabxrE9MNUZ2aP
    FaFp+DyAe+b4nDwuJaW2LURbr8AEZga7oQj0uYxcYw==
    -----END RSA PRIVATE KEY-----
    """
}


public func getJwk() -> [String:String]{
    return ["e": "AQAB", "kid": "8oGvmgZ445GTnX5yrE6MLopX8MxmEhXIqjDaBYgk3Wo", "kty": "RSA", "n": "rcLfGOWt34vk0OAyJtrTsvlnJlZWgnaGsScKxtHjtQ5VXREbnck8zQ0kRHdpmMvFVFWYHRmafsQBjm-eZQhcpjly_5EiuvwMwoHCTpdh6sb32yJ0Rw-xdMgBnliS-V80p6kHSeGRDXqjKk37wHo5FPX3ZTWhdYRK-Jl0jhJ3_Ma06pMz5vekId__-bWy-5Ok0tVPn9dbJDfltBXsaVUj-tYv0DoI4TZ9t1kJ7nSq0mDMLf7SHsAsd9l1YKebwnVEx26raHD9drf8rUp2Wu93A8xAiix0b2kOtHXkQrF7EUZHoerjhHD2zBibKQWqCYISHJBnvY_pGrFV7_ynuNvXEgMKr4IxL5uiVzzsF77pZxw-9aD8iRXqw0zgleNz38cJkqWl90V3-nSvL9WgMIixkMrzfo74mYQcS7mk4z00bprQEqp6AVlNKgrPEba56PdqBYi2jKAd086jUOznxcXRLR2jkMRR_PfRwtHhNqwNKpxZsxpvDOK7ejIN_ehnXjidVELDn5fraUBEPI6F3sg1njZkzSKNJAzAxt-mu-CjUJn3uoouujMSk1D5ExEO_nGC06pOVoRk3Yy9F6HCsWTM0Bcp9nAH_uB1r-54p3OXUiJxqv28b0eK_CPhRspgeiQMqSmaRxIBQ8RZO_jyh1sgsVqW_e15Uk3RH7qfDlwc7OM"]
}



public func getLocalPrivateKey() -> Data {
    let privateKeyPath = URL(fileURLWithPath: "/Users/poojababusing/privateKey.key")
    var privateKey:Data?
    do {
        privateKey = try Data(contentsOf: privateKeyPath, options: .alwaysMapped)
    }
    catch{
        print("error in file")
    }
    return privateKey!;
}

public func getLocalPublicKey() -> Data {
    let publicKeyPath = URL(fileURLWithPath: "/Users/poojababusing/privateKey.key.pub")
    var publicKey:Data?
    do {
        publicKey = try Data(contentsOf: publicKeyPath, options: .alwaysMapped)
    }
    catch{
        print("error in file")
    }
    return publicKey!;
}
