require "uri"

module Markd
  struct Options
    property time, gfm, toc, smart, source_pos, safe, prettyprint
    property transformers : Hash(String, Proc(String, String))
    # If `base_url` is not `nil`, it is used to resolve URLs of relative
    # links. It act's like HTML's `<base href="base_url">` in the context
    # of a Markdown document.
    property base_url : URI?

    def initialize(
      @time = false,
      @gfm = false,
      @toc = false,
      @smart = false,
      @source_pos = false,
      @safe = false,
      @prettyprint = false,
      @base_url = nil,
      @transformers = Hash(String, Proc(String, String)).new
    )
      puts "custom options.."
    end
  end
end
