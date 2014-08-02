module Marooned
  class Project
    def files(project)
      verify_project(project)
      project = Xcodeproj::Project.open(project)
      files = project.files
      files.map(&:real_path).map(&:to_s)
    end

    private

    def verify_project(project)
      return if File.directory?(project) && project.to_s.end_with?(".xcodeproj")
      raise MaroonedException, "#{ project } is an invalid project file"
    end
  end
end
