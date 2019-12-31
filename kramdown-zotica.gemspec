Gem::Specification.new do |s|
  s.name = 'kramdown-zotica'
  s.version = '0.1.0'
  s.summary = "Use zotica in kramdown"
  s.description = "Use zotica in kramdown"
  s.authors = ["Shun Wakatsuki"]
  s.email = 'shun.wakatsuki@gmail.com'
  s.files = ["lib/kramdown-math-zotica.rb"]
  s.homepage = 'https://github.com/shwaka/kramdown-zotica'
  s.license = 'MIT'
  s.add_dependency "zotica"
  s.add_dependency "kramdown"
end
