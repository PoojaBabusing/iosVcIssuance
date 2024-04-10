import Foundation
import SwiftJWT

public class TryVerify{
    let pemString :String
    public let signedJWT : String
    public let signedJWT2 : String
    var myclaims: MyClaims
    var jwt : JWT<MyClaims>
    
    let publicKey : Data
    let jwtVerifier : JWTVerifier
    let verified: Bool
    
    public init() throws {
        pemString = """
       -----BEGIN PUBLIC KEY-----
       MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdlatRjRjogo3WojgGHFHYLugd
       UWAY9iR3fy4arWNA1KoS8kVw33cJibXr8bvwUAUparCwlvdbH6dvEOfou0/gCFQs
       HUfQrSDv+MuSUMAe8jzKE4qW+jK+xQU9a03GUnKHkkle+Q0pX/g6jXZ7r1/xAK5D
       o2kQ+X5xK9cipRgEKwIDAQAB
       -----END PUBLIC KEY-----
       """
        
        signedJWT = "eyJhbGciOiJSUzI1NiIsInR5cCI6Im9wZW5pZDR2Y2ktcHJvb2Yrand0In0.eyJub25jZSI6InF3ZXJ0eXVpbyIsImV4cCI6MTcxMjY4MjIzNi4yMjcxMTUyLCJpc3MiOiJaOExKX3AwbGtoMGFTM3E2Q01HZHJyWHQyLTlNSHZHRDlTOEJZVm85QncwIiwiaWF0IjoxNzEyNjc4NjM2LjIyNzExNTIsImF1ZCI6Imh0dHBzOlwvXC9naXRodWIuY29tIn0.ZAZqkFcc1bwbvTcm2WVQynecKKMkm1BK24uXz5goufFQfkAJyiYbf888vqCNdbfbLJiH05HDqcD2-ocMeqYjo5gZ9J8NoN1DEdTPoglMN-vLUeW5RtLq4wmptYp-wVomy64usOyXhqb2Y6IIJ3E6mAmBUdc4-5G0ou1Z5iR7FlM"
        
        signedJWT2 = "q.q.q"
        
        myclaims = MyClaims(iss: "Z8LJ_p0lkh0aS3q6CMGdrrXt2-9MHvGD9S8BYVo9Bw0",
                            iat: Date() ,
                            exp: Date(timeIntervalSinceNow: 3600),
                            aud: "https://github.com",
                            nonce: "qwertyuio")
        jwt = JWT(claims: myclaims)
        publicKey = pemString.data(using: .utf8)!
        
        jwtVerifier = JWTVerifier.rs256(publicKey: publicKey)
        verified = JWT<MyClaims>.verify(signedJWT2, using: jwtVerifier)
    }
    
    public func printVals(){
        print(verified)
    }
}



