import XCTest
@testable import VcIssuance

final class VcIssuanceTests: XCTestCase {
    
    func testRequestCredential() {
        var issuer = Issuers(publicKey: "H", privateKey: "I", clientId: "J", credentialAudience: "K", credentialEndpoint: "https://github.com", downloadTimeoutInMillSeconds: 2000)
        var vcIssuance = VcIssuance()
        vcIssuance.requestCredential(issuer: issuer, accessToken: "qwert")
        
    }
}
