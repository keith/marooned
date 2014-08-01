module Marooned
  class Finder
    def find(directory)
      search_path = File.join(directory, "**/*")
      files = Dir.glob(search_path)
      files = files.select do |file|
        File.file? file
      end

      files = relative_paths(files, directory)
      files = files.reject(&method(:file_filter))
      absolute_paths(files, directory)
    end

    private

    def file_filter(file)
      regex.match(file)
    end

    def absolute_paths(files, directory)
      files.map do |file|
        File.join(directory, file)
      end
    end

    def relative_paths(files, directory)
      files.map do |file|
        Pathname.new(file).relative_path_from(directory).to_s
      end
    end

    def regex
      Regexp.union(
        [
          /^license(\..*)?$/i,
          /^readme(\..*)?$/i,
          /^Pods\/.*/,
        ]
      )
    end
  end
end
