import PackagePlugin

@main struct GeneratorPlugin: BuildToolPlugin {
    
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let executable: Path = try context.tool(named: "Generator").path
        let directory: Path = context.pluginWorkDirectory.appending(subpath: "GeneratedScources")
        let output: Path = directory.appending(subpath: "Product.swift")
        
        #if os(Windows)
        let command: Command = Command.prebuildCommand(
            displayName: "Generating",
            executable: executable,
            arguments: [directory],
            outputFilesDirectory: directory)
        #else
        let command: Command = Command.buildCommand(
            displayName: "Generating",
            executable: executable,
            arguments: [directory],
            inputFiles: [],
            outputFiles: [output])
        #endif
        
        return [command]
    }
    
}
