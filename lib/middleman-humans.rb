require "middleman-core"

Middleman::Extensions.register(:humans) do
  require "middleman-humans/extension"
  Humans::Extension
end
