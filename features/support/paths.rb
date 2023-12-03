# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    #when /^the (.*) state page$/
    #  path = $1.push('path').join('_')
    #  path = '/state/$1'
    #  puts path
    #  self.send(path)

    when /^the (.*), (.*) page$/
      case $1
      when "San Diego"
        # FOR NOW:
        #   can't find a way to get each county's state + fip at the moment
        #   brute testing
        path = '/state/CA/county/073'
        path
      end

    else
      begin
        page_name =~ /^the (.*) page$/
        #puts page_name
        path_components = $1.split(/\s+/)
        #puts path_components
        path = path_components.push('path').join('_').to_sym
        #path = path_components.to_sym
        #puts path
        self.send(path)
      rescue NoMethodError, ArgumentError => e
        puts e.class #testing purposes
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
