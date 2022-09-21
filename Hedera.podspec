Pod::Spec.new do |s|
  s.name = "Hedera"
  s.version = "0.0.1"
  s.license = { :type => "COMMERCIAL", :text => "Created and licensed by Ivan for dusan" }
  s.summary = "Template project for quickly spinning up new feature projects."
  s.homepage = "https://github.com/idivljak-symphony/hedera-sdk-swift"
  s.authors = "Hedera"
  s.swift_version = "5.5.2"
  s.swift_versions = ["5.5.2"]
  s.source = { :git => "https://github.com/idivljak-symphony/hedera-sdk-swift" }
  s.ios.deployment_target = "14.0"

  s.source_files = [
    "Sources/**/*.swift"
  ]

  s.dependency 'JTLJourney'
  s.dependency 'WYABluetoothLayer'
  s.dependency 'WYASharedUtils'

end
