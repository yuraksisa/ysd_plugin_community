require 'ysd_md_social'
require 'ysd_plugin_community'
require 'sinatra/base'
require 'sinatra/r18n'
require 'ysd_yito_core'

class TestingSinatraApp < Sinatra::Base
  register Sinatra::R18n
  helpers  Sinatra::YitoPageBuilderHelper
  helpers  Sinatra::YitoResourcesLoaderHelper
  #
  # To throw exception in development MODE
  #
  set :raise_errors, true
  set :dump_errors, false
  set :show_exceptions, false
end

module DataMapper
  class Transaction
  	module SqliteAdapter
      def supports_savepoints?
        true
      end
  	end
  end
end

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup :default, "sqlite3::memory:"
DataMapper::Model.raise_on_save_failure = true
DataMapper.finalize 

DataMapper.auto_migrate!

module ThemeMock
  def init_theme
     theme_manager = double("ThemeManager")
     theme = double("Theme")
     Themes::ThemeManager.should_receive(:instance).any_number_of_times.and_return(theme_manager)
     theme_manager.should_receive(:selected_theme).any_number_of_times.and_return(theme)
     theme.should_receive(:root_path).any_number_of_times.and_return('')
     theme.should_receive(:regions).any_number_of_times.and_return(['top', 'header'])
     theme.should_receive(:styles).any_number_of_times.and_return([])
     theme.should_receive(:scripts).any_number_of_times.and_return([])
     theme.should_receive(:resource_path).any_number_of_times.and_return(nil)
  end
end