require 'spec_helper'

describe Slugg do
  context "VERSION" do
    subject { Slugg::VERSION }
    it { should be_a String }
  end

  shared_examples "alias" do |method, options|
    it "is alias to Sanitizer.safe" do
      expect(Slugg.send(method.to_sym, "str")).to be_a String
    end

    it "may assign options" do
      expect(Slugg.send(method.to_sym, "str", options)).to be_a String
    end
  end

  describe ".new" do
    include_examples "alias", "new", { separator: '_' }
  end

  describe ".make" do
    include_examples "alias", "make", { separator: '_' }
  end
end
