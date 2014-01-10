$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sitemap_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sitemap_engine"
  s.version     = SitemapEngine::VERSION
  s.authors     = ["Jerry Richardson"]
  s.email       = ["jerry@jerryr.com"]
  s.homepage    = "https://github.com/disruptive/sitemap_engine"
  s.summary     = "Generate Sitemaps"
  s.description = "Sitemap Generator packaged as a Rails engine."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "haml-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
