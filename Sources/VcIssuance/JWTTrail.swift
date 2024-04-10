import Foundation
import SwiftJWT

public class JWTTrail {
    public let myHeader: Header
    public let myClaims: MyClaims
    public var myJWT: JWT<MyClaims>
    public var jwkJson: [String: String]
    public var jsonDataAsData: Data
    public var jsonString: String
    public let pemString = getPrivateKeyStringForSigning()
    public let privateKey : Data
//    public let localPrivateKey: Data
//    public let localPublicKey: Data
    public let jwtSigner: JWTSigner
    public let signedJWT: String
    
    
    let localPrivateKeyPath : URL
    let localPrivateKey: Data
    let localPublicKeyPath : URL
    let localPublicKey: Data
    
    
    public init() throws {
        jwkJson = getJwk()
        jsonDataAsData = try JSONSerialization.data(withJSONObject: jwkJson, options: .prettyPrinted)
        jsonString = String(data: jsonDataAsData, encoding: .utf8)!
//        localPrivateKey = getLocalPrivateKey()
//        localPublicKey = getLocalPublicKey()
        
        
        
        myHeader = Header(typ: "openid4vci-proof+jwt", jwk: jsonString)
        myClaims = MyClaims(iss: "Z8LJ_p0lkh0aS3q6CMGdrrXt2-9MHvGD9S8BYVo9Bw0",
                        iat: Date() ,
                        exp: Date(timeIntervalSinceNow: 3600),
                        aud: "https://github.com",
                        nonce: "qwertyuio")
        myJWT = JWT(header: myHeader, claims: myClaims)
        privateKey = pemString.data(using: .utf8)!
        
        
        localPrivateKeyPath = URL(fileURLWithPath: "/Users/poojababusing/privateKey.key")
        localPrivateKey = try Data(contentsOf: localPrivateKeyPath, options: .alwaysMapped)
        localPublicKeyPath = URL(fileURLWithPath: "/Users/poojababusing/privateKey.key.pub")
        localPublicKey = try Data(contentsOf: localPublicKeyPath, options: .alwaysMapped)

        
        
        jwtSigner = JWTSigner.rs256(privateKey: localPrivateKey)
//        jwtSigner = JWTSigner.hs256(key: privateKey)
        signedJWT = try myJWT.sign(using: jwtSigner)
    }

    public func printVal(){
        print("this JWT Values are ")
        print(signedJWT)
    }
}
