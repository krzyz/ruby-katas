Dir.entries("test").each do |file|
  require_relative file if /^tc.*\.rb$/ === file
end
