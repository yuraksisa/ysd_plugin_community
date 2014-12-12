module Huasi
  #
  # Manages the join users to contents aspects
  #
  class JoinedUsersAspectDelegate
  
    #
    # Custom representation (the comment fields)
    #
    # @param [Hash] the context
    # @param [Object] the content
    #
    def custom(context={}, element, aspect_model)
    
      app = context[:app]
      
      if app.user.belongs_to?(Users::Group.get('anonymous'))      
        ''
      else
        template_path = File.join(File.dirname(__FILE__), '..', 'views', "joinedusers-render.erb")
        template = Tilt.new(template_path)
        template.render(app) 
      end

    end
    
    #
    # Custom representation (the comment) 
    #
    # @param [Hash] context
    # @param [Object] object
    #
    def custom_extension(context={}, element, aspect_model)

      app = context[:app]

      if app.user.belongs_to?(Users::Group.get('anonymous'))      
        ''
      else    
        locals = {:element => element}
        locals.store(:user, app.user)
        locals.store(:join_action_url, "/api/join/user/content")
        locals.store(:join_action_title, app.t.content_joined_users.join)
        locals.store(:disjoin_action_url, "/api/disjoin/user/content")
        locals.store(:disjoin_action_title, app.t.content_joined_users.disjoin)
        if element.user_joined?(app.user)
          locals.store(:current_state, 'user_joined')
        else
          locals.store(:current_state, 'user_not_joined')
        end        
        template_path = File.join(File.dirname(__FILE__), '..', 'views', "joinedusers-render-extension.erb")
        template = Tilt.new(template_path)
        template.render(app, locals) 
      end
    
    end    
  

  end
end