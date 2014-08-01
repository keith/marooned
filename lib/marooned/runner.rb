module Marooned
  class Runner
    def run(options)
      options = set_default_project(options)
    end

    private

    def set_default_project(options)
      options[:project] ||= first_xcode_project
    end

    def first_xcode_project
      projects = Dir.glob("*.xcodeproj")
      projects = projects.reject(&:is_pods_project)
      exit_project_files unless projects.length > 0
      projects.first
    end

    def is_pods_project(project)
      project == "Pods.xcodeproj"
    end

    def exit_project_files
      puts "No .xcodeproject files available"
      exit 1
    end
  end
end
