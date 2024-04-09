import Foundation
import SwiftJWT

public class TrySign{
    let pemString :String
    let privateKey : Data
    let jwtSigner : JWTSigner
    struct MyClaims: Claims {
       var name: String
    }
    var jwt : JWT<MyClaims>
    public let signedJWT : String
    
    public init() throws {
        pemString = """
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
        
        privateKey = pemString.data(using: .utf8)!
        
        jwtSigner = JWTSigner.rs256(privateKey: privateKey)
        
        jwt = JWT(claims: MyClaims(name: "Kitura"))
        
        signedJWT = try jwt.sign(using: jwtSigner)
    }
    
    public func printVals(){
        print(signedJWT)
    }
}
