import ArgumentParser
import ShellOut

struct SwiftBuild: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "SwiftBuild"
        )
    }
    
    @Option var verbose: Bool = false
    
    func run() throws {
        var arguments: [String] = []
        
        if verbose {
            arguments.append("--verbose")
        }
        
        let shellout = try shellOut(to: "swift build", arguments: arguments)
        print(shellout)
    }
}
