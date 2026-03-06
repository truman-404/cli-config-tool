import Foundation
import ArgumentParser

struct Configuration: Codable {
    let timeout: Int
    let retryCount: Int
    let skipAll: Bool
    let  environment: String
}

@main
struct ConfigTool: ParsableCommand {
    @Option(help: "Test timout in seconds")
    var timeout: Int = 30
    
    @Option(help:" Number of retries on failure")
    var retryCount: Int = 0
    
    @Flag(help: "Skip all tests")
    var skipAll: Bool = false
    
    @Option(help: "Test environment (dev/staging/prod)")
    var environment: String = "dev"
    
    mutating func run() throws{
        
        let config = Configuration(
            timeout: timeout,
            retryCount: retryCount,
            skipAll: skipAll,
            environment: environment
        )
        print("Configuration: ")
        print("  Timeout:  \(timeout)s")
        print("  Retry Count: \(retryCount)")
        print("  Skip All:  \(skipAll)")
        print("  Test Evironment  \(environment)")
        
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        

        do {
            let jsonData = try encoder.encode(config)
            
            if let jsonString = String(data: jsonData, encoding: .utf8){
                print(jsonString)
                
                let fileURL = URL(fileURLWithPath: "config.json")
                try jsonData.write(to: fileURL)
                print("Configuration saved to config.json")
            }
            
            
            
        } catch{
            print("Encountered an error: \(error.localizedDescription)")
        }
        

    }
}

