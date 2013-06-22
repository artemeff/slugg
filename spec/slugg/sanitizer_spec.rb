# encoding: utf-8
require 'spec_helper'

describe Slugg::Sanitizer do
  describe ".new" do
    let(:options) do
      described_class.new(separator: "_", stripper: 'a').options
    end

    it "set separator" do
      options[:separator].should eq "_"
    end

    it "set custom stripper" do
      options[:stripper].should eq 'a'
    end
  end

  describe "#safe" do
    context "with default options" do
      let(:safe) do
        Proc.new { |string| described_class.new.safe string }
      end

      it "replace with separator" do
        safe.("string with spaces").should eq "string-with-spaces"
      end

      it "downcase string" do
        safe.("STRRRING").should eq "strrring"
      end

      it "replace non-english chars" do
        safe.("кто вообще это читает?").should eq "kto-voobshe-eto-chitaet"
      end

      it "remove separator from left and right" do
        safe.("     much    spaces  !     ").should eq "much-spaces"
      end
    end

    context "with custom separator" do
      let(:safe) do
        Proc.new do |string, separator|
          described_class.new(separator: separator).safe string
        end
      end

      it "replace with separator '_'" do
        safe.("string with spaces", "_").should eq "string_with_spaces"
      end
    end

    context "with custom stripper" do
      let(:safe) do
        Proc.new do |string, stripper|
          described_class.new(stripper: stripper).safe string
        end
      end

      it "strips all 'the'" do
        safe.("strip the string", "the").should eq "strip-string"
      end

      it "strips all /\\d/" do
        safe.("strip 123 string", /\d/).should eq "strip-string"
      end
    end
  end
end
