import Foundation

public class VcIssuance{
    
    public init() {}
    
    
    
    public func requestCredential(issuer: Issuers, 
//                                  sign: (String, String,String) -> String ,
                                  accessToken: String) -> String{
        do {
            try isValidURL(issuer.credentialEndpoint)
            print("URL is valid")
        } catch let error as endPointError {
            print("Error: \(error.rawValue)")
        } catch {
            print("An unexpected error occurred: \(error.localizedDescription)")
        }

        
        return ""
    }
    


}
