require 'middleman-core'
require 'middleman/graphviz/command'
require "middleman/graphviz/version"
require "middleman/graphviz/extension"

::Middleman::Extensions.register(:graphviz, ::Middleman::Graphviz::Extension )