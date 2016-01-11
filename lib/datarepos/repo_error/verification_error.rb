# $Id: verification_error.rb 87 2015-04-30 02:20:03Z bmck_newco $
# $(c)$

module DataRepos
  module RepoError
    class VerificationError < ::StandardError
      def initialize(request)
        @url, @whence = request.original_url, DateTime.now
        bad_fn = Rails.root.join('etc', Settings.bad_samples_file)
        CSV.open(bad_fn, 'a') do |bad_file|
          bad_file << [DateTime.now, @url]
        end

        @msg = "#{@whence}: An unverified sample was presented (#{@url})"
      end
    end
  end

  module Clearance
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    class Configuration
      attr_accessor :mailer_sender

      def initialize
        @mailer_sender = 'donotreply@example.com'
      end
    end
  end
end
