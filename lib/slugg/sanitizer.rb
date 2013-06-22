module Slugg
  class Sanitizer
    attr_accessor :options

    def initialize options = {}
      @options = {
       :separator => "-",
       :stripper  => ""
      }.merge options
    end

    def safe string
      string
        .split('')
        .map { |c| c = Slugg::CHARS.include?(c) ? Slugg::CHARS[c] : c }
        .join
        .downcase
        .gsub(@options[:stripper], '')
        .gsub(/[\W|_]+/, @options[:separator])
        .gsub(%r"^#{@options[:separator]}+", '')
        .gsub(%r"#{@options[:separator]}+$", '')

    end
  end
end
