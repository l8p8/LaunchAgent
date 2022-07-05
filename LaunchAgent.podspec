Pod::Spec.new do |spec|
  spec.name         = "LaunchAgent"
  spec.version      = "0.3.0"
  spec.summary      = "Programmatically create and maintain launchd agents and daemons without manually building Property Lists. "
  spec.homepage     = "https://github.com/l8p8/LaunchAgent"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = "Emory Dunn"
  spec.source       = { :git => "https://github.com/l8p8/LaunchAgent.git", :tag => "#{spec.version}" }
  spec.platform     = :macos, '10.9'

  spec.source_files  = "Sources/**/*.swift"

  spec.swift_version = '4.0'
end
