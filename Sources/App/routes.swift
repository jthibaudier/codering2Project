import Routing
import Vapor
import HTTP

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    
    let coderingController = CoderingController()
    router.get("coderen", use: coderingController.coderen)
    router.get("codeer", use: coderingController.toonFormulier)
    
    router.get("", use: coderingController.toonFormulier)
    
}


