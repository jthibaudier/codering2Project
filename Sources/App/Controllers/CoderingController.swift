
// Deze controller wordt op dit moment niet gebruikt

import Vapor
import Foundation

final class CoderingController {
    
    func toonFormulier(_ req: Request) throws -> Future<View> {
        return try req.view().render("welcome")
    }
    
    func coderen(_ req: Request) throws -> Future<View> {
        let filters = try req.query.decode(CoderingFilter.self)
        print("De items: \(filters.sleutel ?? 0) en \(filters.ongecodeerd ?? "")")
        
        let sleutel = filters.sleutel ?? 0
        let ongecodeerd = filters.ongecodeerd ?? ""
        let gecodeerd = Codering.converteer(sleutel: sleutel, ongecodeerd: ongecodeerd)
        
        let data = ["sleutel": String(sleutel), "ongecodeerd": ongecodeerd, "gecodeerd": gecodeerd]
        
        return try req.view().render("resultaat", data)
        
    }

}

struct CoderingFilter: Content {
    var sleutel: Int?
    var ongecodeerd: String?
}
