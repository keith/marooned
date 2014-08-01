require "spec_helper"

describe Marooned::Finder do
  describe "find" do
    it "should return a list of files in the directory" do
      dir = File.join(Pathname.new(__FILE__).dirname, "fixtures/test")
      files = Marooned::Finder.new.find(Pathname.new(dir))
      expect(files).to eq([File.join(dir, "foo.txt")])
    end
  end
end
