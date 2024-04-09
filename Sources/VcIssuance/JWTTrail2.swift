import Foundation
import SwiftJWT

public class JWTTrail2 {
    public let myHeader: Header
    public let myClaims: MyClaims
    public var myJWT: JWT<MyClaims>
    
    let pemString = """
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
    let privateKey : Data

    public let jwtSigner: JWTSigner
    public let signedJWT: String
    let jwkV: String = "qwertyu"
    
    public init() throws {
        myHeader = Header(typ: "openid4vci-proof+jwt")
        myClaims = MyClaims(iss: "Z8LJ_p0lkh0aS3q6CMGdrrXt2-9MHvGD9S8BYVo9Bw0",
                        iat: Date() ,
                        exp: Date(timeIntervalSinceNow: 3600),
                        aud: "https://github.com",
                        nonce: "qwertyuio")
        myJWT = JWT(header: myHeader, claims: myClaims)
        privateKey = pemString.data(using: .utf8)!
        jwtSigner = JWTSigner.rs256(privateKey: privateKey)
        signedJWT = try myJWT.sign(using: jwtSigner)
    }
    
    
    
    public func printVal(){
        
        if let privateKeyData = Data(base64Encoded: privateKey) {
            if let privateKeyString = String(data: privateKeyData, encoding: .utf8) {
                print(">>>>>>>>>>>> ", privateKeyString)
            } else {
                print("Failed to convert data to string using UTF-8 encoding")
            }
        } else {
            print("Invalid base64 string")
        }
        print(">>>>> private key \(privateKey) and type \(type(of: privateKey))")
        print("this JWT Values are ", signedJWT)
    }
    
    
    
}


//const payload = {
//    iss: context.selectedIssuer.client_id,
//    nonce: decodedToken.c_nonce,
//    aud: context.selectedIssuer.credential_audience,
//    iat: Math.floor(new Date().getTime() / 1000),
//    exp: Math.floor(new Date().getTime() / 1000) + 18000,
//  };


