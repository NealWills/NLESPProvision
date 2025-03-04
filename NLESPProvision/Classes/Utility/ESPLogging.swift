// Copyright 2020 Espressif Systems
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  ESPLogging.swift
//  ESPProvision
//

import XCGLogger

import Foundation

/// Type that manages printing of formatted console logs for debugging process.
enum ESPLog {
    /// Boolean to determine whether console log needs to be printed
    static var isLogEnabled = false

    /// Prints messages in console that are triggered from different functions in a workflow.
    /// Add additional info like timestamp, filename, function name and line before printing the output.
    ///
    /// - Parameters:
    ///   - message: Message describing the current instruction in a workflow.
    ///   - file: Filename containing the caller of this function.
    ///   - function: Name of the function invoking this method.
    ///   - line: Line number from where the logs are generated.
    static func log(_ message: String, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
//        if isLogEnabled {
//            var filename = (file as NSString).lastPathComponent
//            filename = filename.components(separatedBy: ".")[0]
//
//            let currentDate = Date()
//            let df = DateFormatter()
//            df.dateFormat = "HH:mm:ss.SSS"
//
//            print(" ")
//            print("===============")
//            print("【 ESP 】 \n \(df.string(from: currentDate)) \n \(filename).\(function) (\(line)) : \(message)")
//            print("===============")
//        }

        log.debug("【 ESP 】: " + message, functionName: function, fileName: file, lineNumber: line)
    }

    static func info(_ message: String, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        log.info("【 ESP 】: " + message, functionName: function, fileName: file, lineNumber: line)
    }

    static func debug(_ message: String, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        log.debug("【 ESP 】: " + message, functionName: function, fileName: file, lineNumber: line)
    }

    private static let documentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()

    private static let log: XCGLogger = { // see bug report: rdar://49294916 or https://openradar.appspot.com/radar?id=4952305786945536
        // Setup XCGLogger (Advanced/Recommended Usage)
        // Create a logger object with no destinations
        let log = XCGLogger(identifier: "ESPProvisionLogger", includeDefaultDestinations: false)

        // Create a destination for the system console log (via NSLog)
        let systemDestination = AppleSystemLogDestination(identifier: "MeatmeetLogger.appleSystemLogDestination")

        // Optionally set some configuration options
        systemDestination.outputLevel = .debug
        systemDestination.showLogIdentifier = false
        systemDestination.showFunctionName = true
        systemDestination.showThreadName = true
        systemDestination.showLevel = true
        systemDestination.showFileName = true
        systemDestination.showLineNumber = true
        systemDestination.showDate = true

        // Add the destination to the logger
        log.add(destination: systemDestination)

        // Create a file log destination
        let logDirectory: URL = documentsDirectory.appendingPathComponent("ESProvision/Log")
        if !FileManager.default.fileExists(atPath: logDirectory.path) {
            do {
                try FileManager.default.createDirectory(atPath: logDirectory.path, withIntermediateDirectories: true, attributes: nil)
                print("成功创建目录 \(logDirectory)")
            } catch {
                print("无法创建目录： \(logDirectory)_\(error.localizedDescription)")
            }
        }
        let date = Date()
        let day = ESPLog.dateToString(date: date, formatter: "yyyy_MM_dd")
        let logPath = logDirectory.appendingPathComponent("esprovision_log_" + day)
        let autoRotatingFileDestination = AutoRotatingFileDestination(
            writeToFile: logPath,
            identifier: "MeatmeetLogger.fileDestination",
            shouldAppend: true,
            attributes: [.protectionKey: FileProtectionType.completeUntilFirstUserAuthentication], // Set file attributes on the log file
            maxFileSize: 1024 * 1024 * 500, // 5k, not a good size for production (default is 1 megabyte)
            maxTimeInterval: 60 * 60 * 24, // 1 minute, also not good for production (default is 10 minutes)
            targetMaxLogFiles: 5
        ) // Default is 10, max is 255

        // Optionally set some configuration options
        autoRotatingFileDestination.outputLevel = .info
        autoRotatingFileDestination.showLogIdentifier = false
        autoRotatingFileDestination.showFunctionName = true
        autoRotatingFileDestination.showThreadName = true
        autoRotatingFileDestination.showLevel = true
        autoRotatingFileDestination.showFileName = true
        autoRotatingFileDestination.showLineNumber = true
        autoRotatingFileDestination.showDate = true

        // Process this destination in the background
        autoRotatingFileDestination.logQueue = XCGLogger.logQueue

        // Add colour (using the ANSI format) to our file log, you can see the colour when `cat`ing or `tail`ing the file in Terminal on macOS
        let ansiColorLogFormatter = ANSIColorLogFormatter()
        ansiColorLogFormatter.colorize(level: .verbose, with: .colorIndex(number: 244), options: [.faint])
        ansiColorLogFormatter.colorize(level: .debug, with: .black)
        ansiColorLogFormatter.colorize(level: .info, with: .blue, options: [.underline])
        ansiColorLogFormatter.colorize(level: .notice, with: .green, options: [.italic])
        ansiColorLogFormatter.colorize(level: .warning, with: .red, options: [.faint])
        ansiColorLogFormatter.colorize(level: .error, with: .red, options: [.bold])
        ansiColorLogFormatter.colorize(level: .severe, with: .white, on: .red)
        ansiColorLogFormatter.colorize(level: .alert, with: .white, on: .red, options: [.bold])
        ansiColorLogFormatter.colorize(level: .emergency, with: .white, on: .red, options: [.bold, .blink])
        autoRotatingFileDestination.formatters = [ansiColorLogFormatter]

        // Add the destination to the logger
        log.add(destination: autoRotatingFileDestination)

        // Add basic app info, version info etc, to the start of the logs
        log.logAppDetails()

        // You can also change the labels for each log level, most useful for alternate languages, French, German etc, but Emoji's are more fun
        //    log.levelDescriptions[.verbose] = "🗯"
        //    log.levelDescriptions[.debug] = "🔹"
        //    log.levelDescriptions[.info] = "ℹ️"
        //    log.levelDescriptions[.notice] = "✳️"
        //    log.levelDescriptions[.warning] = "⚠️"
        //    log.levelDescriptions[.error] = "‼️"
        //    log.levelDescriptions[.severe] = "💣"
        //    log.levelDescriptions[.alert] = "🛑"
        //    log.levelDescriptions[.emergency] = "🚨"

        // Alternatively, you can use emoji to highlight log levels (you probably just want to use one of these methods at a time).
        //    let emojiLogFormatter = PrePostFixLogFormatter()
        //    emojiLogFormatter.apply(prefix: "🗯🗯🗯 ", postfix: " 🗯🗯🗯", to: .verbose)
        //    emojiLogFormatter.apply(prefix: "🔹🔹🔹 ", postfix: " 🔹🔹🔹", to: .debug)
        //    emojiLogFormatter.apply(prefix: "ℹ️ℹ️ℹ️ ", postfix: " ℹ️ℹ️ℹ️", to: .info)
        //    emojiLogFormatter.apply(prefix: "✳️✳️✳️ ", postfix: " ✳️✳️✳️", to: .notice)
        //    emojiLogFormatter.apply(prefix: "⚠️⚠️⚠️ ", postfix: " ⚠️⚠️⚠️", to: .warning)
        //    emojiLogFormatter.apply(prefix: "‼️‼️‼️ ", postfix: " ‼️‼️‼️", to: .error)
        //    emojiLogFormatter.apply(prefix: "💣💣💣 ", postfix: " 💣💣💣", to: .severe)
        //    emojiLogFormatter.apply(prefix: "🛑🛑🛑 ", postfix: " 🛑🛑🛑", to: .alert)
        //    emojiLogFormatter.apply(prefix: "🚨🚨🚨 ", postfix: " 🚨🚨🚨", to: .emergency)
        //    log.formatters = [emojiLogFormatter]

        let customLogFormatter = ESPCustomLogFormatter()
        log.formatters = [customLogFormatter]
        return log
    }()

    private class ESPCustomLogFormatter: LogFormatterProtocol, CustomDebugStringConvertible {
        // 实现 CustomDebugStringConvertible 协议的 debugDescription 属性
        var debugDescription: String {
            return "<CustomLogFormatter>"
        }

        func format(logDetails: inout LogDetails, message: inout String) -> String {
            if let tag = logDetails.userInfo["com.cerebralgardens.xcglogger.tags"] as? String, let dev = logDetails.userInfo["com.cerebralgardens.xcglogger.devs"] as? String {
                message = "[\(tag)] [\(dev)] \(message)"
            }
            return message
        }
    }

    static func dateToString(date: Date, formatter: String = "yyyy-MM-dd HH:mm:ss.SSS") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: date)
    }
}
