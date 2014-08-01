require "bundler/gem_tasks"
require "marooned/version"
require "rake/packagetask"

GEMS_DIR = "vendor/gems"
GH_PAGES_DIR = "gh-pages"
HOMEBREW_FORMULAE_DIR = "homebrew-formulae"

namespace :gems do
  desc "Vendorize dependencies"
  task :vendorize do
    system("vendor/vendorize", GEMS_DIR)
  end

  desc "Remove vendorized dependencies"
  task :clean do
    if Dir.exists?(GEMS_DIR)
      FileUtils.rm_r(GEMS_DIR)
    end
  end
end

namespace :homebrew do
  desc "Generate homebrew formula and add it to the repo"
  task :build => ["checkout", "formula:build", "commit"]

  desc "Checkout homebrew repo locally"
  task :checkout do
    `git clone https://github.com/Keithbsmiley/homebrew-formulae.git #{ HOMEBREW_FORMULAE_DIR }`
  end

  desc "Check in the new Homebrew formula"
  task :commit do
    Dir.chdir(HOMEBREW_FORMULAE_DIR) do
      `git add Formula/marooned.rb`
      `git commit -m "marooned: Release version #{ Marooned::VERSION }"`
    end
  end

  desc "Push homebrew repo"
  task :push do
    Dir.chdir(HOMEBREW_FORMULAE_DIR) do
      `git push`
    end
  end

  desc "Remove Homebrew repo"
  task :clean do
    if Dir.exists?(HOMEBREW_FORMULAE_DIR)
      FileUtils.rm_rf(HOMEBREW_FORMULAE_DIR)
    end
  end

  namespace :formula do
    desc "Build homebrew formula"
    task :build do
      formula = File.read("homebrew/marooned.rb")
      formula.gsub!("__VERSION__", Marooned::VERSION)
      formula.gsub!("__SHA__", `shasum pkg/marooned-#{ Marooned::VERSION }.tar.gz`.split.first)
      File.write("#{ HOMEBREW_FORMULAE_DIR }/Formula/marooned.rb", formula)
    end
  end
end

namespace :tarball do
  desc "Build the tarball"
  task :build => ["checkout", "package", "move", "commit"]

 desc "Checkout gh-pages"
  task :checkout do
    `git clone --branch gh-pages https://github.com/Keithbsmiley/marooned.git #{ GH_PAGES_DIR }`
  end

  desc "Move tarball into gh-pages"
  task :move do
    FileUtils.mv("pkg/marooned-#{Marooned::VERSION}.tar.gz", GH_PAGES_DIR)
  end

  desc "Check in the new tarball"
  task :commit do
    Dir.chdir(GH_PAGES_DIR) do
      `git add marooned-#{Marooned::VERSION}.tar.gz`
      `git commit -m "Release version #{Marooned::VERSION}"`
    end
  end

  desc "Push the gh-pages branch"
  task :push do
    Dir.chdir(GH_PAGES_DIR) do
      `git push`
    end
  end

  Rake::PackageTask.new("marooned", Marooned::VERSION) do |p|
    p.need_tar_gz = true
    p.package_files.include("src/**/*")
    p.package_files.include("lib/**/*")
    p.package_files.include("vendor/**/*")
    p.package_files.include("LICENSE")
  end
end
