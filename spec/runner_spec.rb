require "spec_helper"

describe Marooned::Runner do
  describe "run" do
    it "should set a default project" do
      allow(Dir).to receive(:glob).and_return(["foo.xcodeproj"])
      runner = Marooned::Runner.new
      allow(runner).to receive(:diff_files).and_return(nil)
      options = runner.run({})
      expect(options[:project]).to eq("foo.xcodeproj")
    end

    it "should fail if there are no projects" do
      allow(Dir).to receive(:glob).and_return([])
      expect { Marooned::Runner.new.run({}) }
        .to raise_exception MaroonedException
    end

    it "should ignore pods projects" do
      allow(Dir).to receive(:glob).and_return(["Pods.xcodeproj"])
      expect { Marooned::Runner.new.run({}) }
        .to raise_exception MaroonedException
    end

    it "should not overwrite the passed project" do
      runner = Marooned::Runner.new
      allow(runner).to receive(:diff_files).and_return(nil)
      options = runner.run(project: "foo.xcodeproj")
      expect(options[:project]).to eq("foo.xcodeproj")
    end
  end

  describe "diff_files" do
    it "should return a list of stranded files" do
      dir = Pathname.new(File.join(Pathname.new(__FILE__).dirname,
                                   "fixtures/project/test/test.xcodeproj"))
      files = Marooned::Runner.new.diff_files(dir)
      expect(files).to eq([File.join(dir.dirname, "foo.txt")])
    end
  end
end
