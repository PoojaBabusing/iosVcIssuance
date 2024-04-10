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
        pemString = getPrivateKeyStringForVerifying()
        
        privateKey = pemString.data(using: .utf8)!
        
        jwtSigner = JWTSigner.rs256(privateKey: privateKey)
        
        jwt = JWT(claims: MyClaims(name: "Kitura"))
        
        signedJWT = try jwt.sign(using: jwtSigner)
    }
    
    public func printVals(){
        print(signedJWT)
    }
}
