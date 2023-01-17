import ArgumentParser
import ShellOut

@main
struct SwiftBuild: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "SwiftBuild",
            abstract: "Proxy to the `swift build` command, executing in a specific directory."
        )
    }
    
    @Option(help: "Build the specified target") var target: String = ""
    @Option(help: "Build the specified product") var product: String = ""
    @Option(help: "Increase verbosity to include informational output.") var verbose: Bool = false
    @Option(help: "Path at which the command will be executed.") var workingDirectory: String
    
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
        
        let output = try shellOut(to: "swift build", arguments: arguments, at: workingDirectory)
        print(output)
    }
}
