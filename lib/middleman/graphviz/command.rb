require 'middleman-core/cli'

module Middleman
  module Cli
    # This class provides a "deploy" command for the middleman CLI.
    class Graphviz < Thor
      include Thor::Actions

      check_unknown_options!

      namespace :graphviz

      # Tell Thor to exit with a nonzero exit code on failure
      def self.exit_on_failure?
        true
      end

      desc 'graphviz [options]', 'Run this amazing command'
      method_option 'clean',
        type: :boolean,
        aliases: '-c',
        desc: 'Clean all the build files'
      def graphviz
        puts "Running my command"
      end
    end
  end
end