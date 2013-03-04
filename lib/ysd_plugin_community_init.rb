require 'ysd-plugins' unless defined?Plugins::Plugin
require 'ysd_plugin_community_extension'

Plugins::SinatraAppPlugin.register :community do

   name=        'community'
   author=      'yurak sisa'
   description= 'Integrate the community application'
   version=     '0.1'
   sinatra_helper    Sinatra::CommunityHelpers
   sinatra_extension Sinatra::YSD::Community
   sinatra_extension Sinatra::YSD::CommunityProfile
   hooker            Huasi::CommunityExtension
  
end