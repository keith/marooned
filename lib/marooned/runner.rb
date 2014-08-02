module Marooned
  class Runner
    def run(options)
      set_default_project(options)
      puts diff_files(options[:project])
      options
    end

    def diff_files(project)
      path = path_for_project(project)
      local_files = Finder.new.find(path.dirname)
      project_files = Project.new.files(path)
      local_files - project_files
    end

    private

    def set_default_project(options)
      options[:project] ||= first_xcode_project
    end

    def path_for_project(project)
      path = Pathname.new(project)
      unless path.absolute?
        path = Pathname.new(File.join(Pathname.pwd, project))
      end

      path
    end

    def first_xcode_project
      projects = Dir.glob("*.xcodeproj")
      projects = projects.reject(&method(:pods_project?))
      exit_project_files unless projects.length > 0
      projects.first
    end

    def pods_project?(project)
      project == "Pods.xcodeproj"
    end

    def exit_project_files
      raise MaroonedException, "No xcodeproj files available"
    end
  end
end
