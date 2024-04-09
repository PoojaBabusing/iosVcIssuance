import Foundation
import SwiftJWT

public class JWTTrail {
    public let myHeader: Header
    public let myClaims: MyClaims
    public var myJWT: JWT<MyClaims>
    
    public let privateKeyPath: URL
    public let privateKey: Data    
//    public let publicKeyPath: URL
//    public let publicKey: Data
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
        
        privateKeyPath = URL(fileURLWithPath: "/Users/poojababusing/privateKey.key")
        privateKey = try Data(contentsOf: privateKeyPath, options: .alwaysMapped)
//        publicKeyPath = URL(fileURLWithPath: "/Users/poojababusing/privateKey.key.pub")
//        publicKey = try Data(contentsOf: publicKeyPath, options: .alwaysMapped)
        
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

public struct MyClaims: Claims {
    let iss: String
    let iat: Date
    let exp: Date
    let aud: String
    let nonce: String
}

//const payload = {
//    iss: context.selectedIssuer.client_id,
//    nonce: decodedToken.c_nonce,
//    aud: context.selectedIssuer.credential_audience,
//    iat: Math.floor(new Date().getTime() / 1000),
//    exp: Math.floor(new Date().getTime() / 1000) + 18000,
//  };

