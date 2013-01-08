Gem::Specification.new do |s|
  s.name    = "ysd_plugin_community"
  s.version = "0.1.1"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-06-08"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "Community integration"
  s.summary = "Community integration"
  
  s.add_runtime_dependency "ysd_plugin_cms"            # Page serving
  s.add_runtime_dependency "ysd_plugin_profile"        # Model access through REST API
  s.add_runtime_dependency "ysd_yito_core"
  s.add_runtime_dependency "ysd_yito_js"
  s.add_runtime_dependency "ysd_plugin_media_gallery"  # Model access through REST API ** REVIEW **
  s.add_runtime_dependency "ysd_core_plugins"          # The plugin system : to extend the module functionality
  s.add_runtime_dependency "ysd_core_themes"           # Themes : serving static content

  
end