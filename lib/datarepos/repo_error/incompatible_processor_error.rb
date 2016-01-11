# $Id$
# $(c)$

module DataRepos
  module RepoError
    class IncompatibleProcessorError < ::StandardError
      def initialize
        @msg = "Incompatible Processor. \nCall stack: #{caller[0..8].join("\n")}"
      end
    end
  end
end
