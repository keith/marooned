module Marooned
  class CLI
    def initialize(argv)
      @argv = argv
      @options = {}
    end

    def run
      global_options.parse!(@argv)
      Runner.new.run(@options)
    end

    def global_options
      OptionParser.new do |opts|
        opts.banner = "usage: marooned [-v | --version] [-h | --help] [options]"

        opts.on("-v", "--version", "Print the version and exit") do
          puts "#{ Marooned::VERSION }"
          exit
        end

        opts.on("-h", "--help", "Print the help message and exit") do
          puts opts
          exit
        end

        opts.on("-p", "--project [PROJECT_NAME]",
                "Specify the Xcode project to check") do |project|
          @options[:project] = project
        end

        opts.on("-d", "--directory [DIRECTORY_NAME]",
                "Specify the directory to search for files in") do |directory|
          path = Pathname.new(File.join(Pathname.pwd, directory))
          @options[:directory] = path
        end
      end
    end
  end
end
