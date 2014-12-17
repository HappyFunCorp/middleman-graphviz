# Middleman::Graphviz

This middleman extention creates a helper which lets you embed svg graphs
inside of your documents using the [dot language](http://www.graphviz.org/pdf/dotguide.pdf)

## Installation

Install graphviz if you haven't already.  On OSX you do:

```sh
$ brew install graphviz
```

Make sure the `dot` command is accessible using `which dot`.


Add this line to your middleman application's Gemfile:

```ruby
gem 'middleman-graphviz'
```

And then execute:

    $ bundle

Then activate the extenion in `config.rb`

```ruby
activate :graphviz
```

## Usage in ERB

You use the `graphviz` helper with a block.  The content of the block will be passed into the `dot` command, and the SVG output will be rendered inside of the page:

For example:

```erb
<% graphviz do %>
digraph G {

  subgraph cluster_0 {
    style=filled;
    color=lightgrey;
    node [style=filled,color=white];
    a0 -> a1 -> a2 -> a3;
    label = "process #1";
  }

  subgraph cluster_1 {
    node [style=filled];
    b0 -> b1 -> b2 -> b3;
    label = "process #2";
    color=blue
  }
  start -> a0;
  start -> b0;
  a1 -> b3;
  b2 -> a3;
  a3 -> a0;
  a3 -> end;
  b3 -> end;

  start [shape=Mdiamond];
  end [shape=Msquare];
}
<% end %>
```

## Usage in Markdown

Most middleman blog posts are created with `.markdown`.  You need to rename these files to be `.markdown.erb` so they get processed through ERB first.

## Contributing

1. Fork it ( https://github.com/HappyFunCorp/middleman-graphviz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
