module Marooned
  class CLI
    def initialize(argv)
      @argv = argv
    end

    def run
      global_options.parse!(@argv)
    end

    def global_options
      OptionParser.new do |opts|
        opts.banner = "usage: marooned [-v | --version] [-h | --help] [options]"

        opts.on("-v", "--version", "Print the version and exit") do
          puts "#{ Marooned::VERSION }"
        end
      end
    end
  end
end
