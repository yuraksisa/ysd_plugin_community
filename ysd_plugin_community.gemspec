Gem::Specification.new do |s|
  s.name    = "ysd_plugin_community"
  s.version = "0.1.7"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-06-08"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "Community integration"
  s.summary = "Community integration"
  
  s.add_runtime_dependency "tilt"
  
  s.add_runtime_dependency "ysd_md_profile"            # Profile model
  
  s.add_runtime_dependency "ysd_yito_core"
  s.add_runtime_dependency "ysd_yito_js"
  s.add_runtime_dependency "ysd_core_plugins"          # The plugin system : to extend the module functionality
  s.add_runtime_dependency "ysd_core_themes"           # Themes : serving static content

  s.add_runtime_dependency "ysd_plugin_profile"        # Profile plugin
  
end