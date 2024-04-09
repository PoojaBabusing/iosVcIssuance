import Foundation

public struct Issuers {
    public var publicKey: String;
    public var privateKey: String;
    public var clientId: String;
    public var credentialAudience: String;
    public var credentialEndpoint: String;
    public var downloadTimeoutInMillSeconds: Int;
    
    public init(publicKey: String, privateKey: String, clientId: String, credentialAudience: String, credentialEndpoint: String, downloadTimeoutInMillSeconds: Int) {
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.clientId = clientId
        self.credentialAudience = credentialAudience
        self.credentialEndpoint = credentialEndpoint
        self.downloadTimeoutInMillSeconds = downloadTimeoutInMillSeconds
    }
}
