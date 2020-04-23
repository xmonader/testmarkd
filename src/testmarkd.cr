require "./markd"

# TODO: Write documentation for `Testmarkd`
module Testmarkd
  VERSION = "0.1.0"

  # TODO: Put your code here
  puts "Hello"

  markdown = <<-MD
  # Hello Markd
  [relative](./relativefile.md)
  > Yet another markdown parser built for speed, written in Crystal, Compliant to CommonMark specification.
  MD

  class Transformers
    def onlink(txt : String)
      puts "onlink now", txt
      return "done..."
    end
  end

  t = Transformers.new
  transformers = Hash(String, Proc(String, String)).new
  #   t.onlink("aa")
  transformers["onlink"] = ->t.onlink(String)

  html = Markd.to_html(markdown)
  puts html

  options = Markd::Options.new(time: true, transformers: transformers)
  document = Markd::Parser.parse(markdown, options)
  renderer = Markd::HTMLRenderer.new(options)

  #   html = renderer.render(document)
end
