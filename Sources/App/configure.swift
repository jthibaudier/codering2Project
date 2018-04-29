import FluentSQLite
import Leaf
import Vapor

/// Called before your application initializes.
///
/// https://docs.vapor.codes/3.0/getting-started/structure/#configureswift
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    let leafProvider = LeafProvider();
    try services.register(leafProvider);
    
    config.prefer(LeafRenderer.self, for: TemplateRenderer.self)

}
