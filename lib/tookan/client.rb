# frozen_string_literal: true

module Tookan
  class Client < API
    Dir[File.expand_path('client/*.rb', __dir__)].sort.each { |f| require f }

    include Tookan::Client::All
  end
end
