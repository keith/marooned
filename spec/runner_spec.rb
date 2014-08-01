require "spec_helper"

describe Marooned::Runner do
  describe "run" do
    it "should set a default project" do
      allow(Dir).to receive(:glob).and_return(["foo.xcodeproj"])
      options = Marooned::Runner.new.run({})
      expect(options[:project]).to eq("foo.xcodeproj")
    end

    it "should fail if there are no projects" do
      allow(Dir).to receive(:glob).and_return([])
      expect { Marooned::Runner.new.run({}) }.to raise_exception MaroonedException
    end

    it "should ignore pods projects" do
      allow(Dir).to receive(:glob).and_return(["Pods.xcodeproj"])
      expect { Marooned::Runner.new.run({}) }.to raise_exception MaroonedException
    end

    it "should not overwrite the passed project" do
      options = Marooned::Runner.new.run({project: "foo.xcodeproj"})
      expect(options[:project]).to eq("foo.xcodeproj")
    end
  end
end
