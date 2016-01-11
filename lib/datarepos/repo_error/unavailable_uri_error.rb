# $Id$
# $(c)$

module DataRepos
  module RepoError
    class UnavailableUriError < ::StandardError
      def initialize(uri)
        @msg = "Unavailable URI (#{uri})."
      end
    end
  end
end
