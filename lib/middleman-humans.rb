require "middleman-core"

Middleman::Extensions.register :middleman-humans do
  require "my-extension/extension"
  MyExtension
end
