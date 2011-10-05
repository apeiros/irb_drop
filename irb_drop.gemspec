# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "irb_drop"
  s.version                   = "0.0.1"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  # According to Eric Hodel (Rubygems maintainer), you should generally not set this value
  # s.date                      = "2011-10-05"
  s.authors                   = "AWD Schweiz"
  s.description               = <<-DESCRIPTION.gsub(/^    /, '').chomp
    Enables you to drop into an IRB session from any code.
  DESCRIPTION
  s.summary                   = <<-SUMMARY.gsub(/^    /, '').chomp
    IRB sessions anywhere!
  SUMMARY
  s.email                     = "info@awd.ch"
  s.files                     =
    Dir['bin/**/*'] +
    Dir['lib/**/*'] +
    Dir['rake/**/*'] +
    Dir['test/**/*'] +
    %w[
      irb_drop.gemspec
      Rakefile
      README.markdown
    ]
  s.require_paths             = %w[lib]
  if File.directory?('bin') then
    executables = Dir.chdir('bin') { Dir.glob('**/*').select { |f| File.executable?(f) } }
    s.executables = executables unless executables.empty?
  end
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end
