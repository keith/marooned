require "spec_helper"

describe Marooned::Project do
  describe "files" do
    it "should return a list of files" do
      dir = File.join(Pathname.new(__FILE__).dirname, "fixtures/project/test/test.xcodeproj")
      files = Marooned::Project.new.files(dir)
      expect(files.length).to eq(16)
    end

    it "should raise an exception for invalid projects" do
      dir = File.join(Pathname.new(__FILE__).dirname, "fixtures/project/test/")
      expect { Marooned::Project.new.files(dir) }.to raise_exception MaroonedException
    end
  end
end
