require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener
require 'ysd_md_social' unless defined?Yito::Social::JoinedUser
require 'ysd_md_cms' unless defined?ContentManagerSystem::View

#
# Community Extension
#
module Huasi

  class CommunityExtension < Plugins::ViewListener
     
    # ========= Installation =================

    # 
    # Install the plugin
    #
    def install(context={})

      ContentManagerSystem::View.first_or_create({:view_name => 'current_content_joined_users'},
       {
         :description => 'Retrieve the users joined to the current content',
         :model_name => 'contentuser',
         :query_conditions => {:field => 'content.id', :operator => '$eq', :value => '#{content.id}'},
         :query_order => [],
         :query_arguments => [],
         :style => :fields,
         :v_fields => [
            {:field => 'user.photo_url_tiny', :image => true, :link => '/profile/#{element.user.username}'}
            ],
         :render => :div,
         :render_options => {},
         :view_limit => 0,
         :pagination => true,
         :ajax_pagination => true,
         :page_size => 25,
         :pager => :default,
         :block => true
       })

      ContentManagerSystem::View.first_or_create({:view_name => 'content_joined_users'},
       {
         :description => 'Retrieve the users joined to the content',
         :model_name => 'contentuser',
         :query_conditions => {:field => 'content.id', :operator => '$eq', :value => '%{0}'},
         :query_order => [],
         :query_arguments => [{:order => 0, :type => :integer, :name => 'content.id' }],
         :style => :fields,
         :v_fields => [
            {:field => 'user.photo_url_tiny', :image => true, :link => '/profile/#{element.user.username}'}
            ],
         :render => :div,
         :render_options => {},
         :view_limit => 0,
         :pagination => true,
         :ajax_pagination => true,
         :page_size => 25,
         :pager => :default,
         :block => true
       })



    end

    #
    # Extension initialization (on runtime)
    #
    def init(context={})

      app = context[:app]
      
      ::Model::ViewModel.new(:contentuser, 
         'Content Users', 
         Yito::Social::ContentUser, 
         :view_template_content_users,[]) 
    
    end

    # ========= Application regions ======
    
    #
    # Retrieve the regions used by the apps 
    #
    def apps_regions(context={})
      [:profile_tabs]
    end

    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})
    
      routes = [{:path => "/community",
                 :regular_expression => /^\/community/,
                 :title => 'Community',
                 :description => 'The community page',
                 :fit => 1,
                 :module => :community},
                {:path => '/profile/:id',
                 :regular_expression => /^\/profile\/.+/,
                 :title => 'Show profile',
                 :description => 'Visit a user profile',
                 :fit => 1,
                 :module => :community},
                {:path => '/profile',
                 :regular_expression => /^\/profile/,
                 :title => 'Show our profile',
                 :description => 'Visit our profile',
                 :fit => 1,
                 :module => :community},              
               ]
    
    end
 
    # ========= Aspects ==================
    
    #
    # Retrieve an array of the aspects defined in the plugin
    #
    def aspects(context={})
      
      app = context[:app]
      
      aspects = []
      aspects << ::Plugins::Aspect.new(:content_joined_users, app.t.aspect.content_joined_users, 
                                       Yito::Social::JoinedUser, 
                                       Huasi::JoinedUsersAspectDelegate.new)
                                
      return aspects
       
    end

  end #CommunityExtension
end #Social