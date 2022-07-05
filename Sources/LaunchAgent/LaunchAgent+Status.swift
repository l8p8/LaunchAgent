//
//  LaunchAgent+Status.swift
//  LaunchAgent
//
//  Created by Emory Dunn on 2018-02-19.
//

import Foundation

/// The status of a job given by `launchctl list`
public enum AgentStatus: Equatable {
    
    /// Indicates the job is running, with the given PID/
    case running(pid: Int)
    
    /// Indicates the job is loaded, but not running.
    case loaded
    
    /// Indicates the job is unloaded.
    case unloaded
    
    public static func ==(lhs: AgentStatus, rhs: AgentStatus) -> Bool {
        switch (lhs, rhs) {
        case ( let .running(lhpid), let .running(rhpid) ):
            return lhpid == rhpid
        case (.loaded, .loaded):
            return true
        case (.unloaded, .unloaded):
            return true
        default:
            return false
        }
    }
    
}

extension LaunchAgent {
    
    // MARK: LaunchControl
    
    /// Run `launchctl start` on the agent
    ///
    /// Check the status of the job with `.status()`
    public func start() -> Process {
        return LaunchControl.shared.start(self)
    }
    
    /// Run `launchctl stop` on the agent
    ///
    /// Check the status of the job with `.status()`
    public func stop() -> Process {
        return LaunchControl.shared.stop(self)
    }
    
    /// Run `launchctl load` on the agent
    ///
    /// Check the status of the job with `.status()`
    @available(macOS, deprecated: 10.11)
    public func load() throws -> Process {
        return try LaunchControl.shared.load(self)
    }
    
    /// Run `launchctl unload` on the agent
    ///
    /// Check the status of the job with `.status()`
    @available(macOS, deprecated: 10.11)
    public func unload() throws -> Process {
        return try LaunchControl.shared.unload(self)
    }
    
    /// Run `launchctl bootstrap` on the agent
    ///
    /// Check the status of the job with `.status()`
    @available(macOS, introduced: 10.11)
    public func bootstrap() throws -> Process {
        return try LaunchControl.shared.bootstrap(self)
    }
    
    /// Run `launchctl bootout` on the agent
    ///
    /// Check the status of the job with `.status()`
    @available(macOS, introduced: 10.11)
    public func bootout() throws -> Process {
        return try LaunchControl.shared.bootout(self)
    }
    
    /// Retreives the status of the LaunchAgent from `launchctl`
    ///
    /// - Returns: the agent's status
    public func status() -> AgentStatus {
        return LaunchControl.shared.status(self)
    }
    
}

