import ArgumentParser
import ShellOut

@main
struct SwiftBuild: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "SwiftBuild"
        )
    }
    
    @Option var target: String = ""
    @Option var product: String = ""
    @Option var verbose: Bool = false
    @Option var githubWorkspace: String
    
    func run() throws {
        var arguments: [String] = []
        
        if !target.isEmpty {
            arguments.append("--target \(target)")
        }
        if !product.isEmpty {
            arguments.append("--product \(product)")
        }
        if verbose {
            arguments.append("--verbose")
        }
        
        let shellout = try shellOut(to: "swift build", arguments: arguments, at: githubWorkspace)
        print(shellout)
    }
}
