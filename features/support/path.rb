module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the users page/
      users_path
    end
  end
end

World(NavigationHelpers)
