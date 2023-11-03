# frozen_string_literal: true

require 'json'

module Tookan
  module Request
    def request(method, path, _options)
      options = default_body.merge(_options)

      response = connection.send(method) do |req|
        req.path = URI.encode_www_form_component(path)

        case method
        when :get
          req.params = options
        when :post
          req.body = options.to_json
        end
      end

      data = JSON.parse(response.body)

      if data.key?('status')
        case data['status']
        when 100
          raise Tookan::ParameterMissing, data['message']
        when 101
          raise Tookan::InvalidKey, data['message']
        when 201
          raise Tookan::ShowErrorMessage, data['message']
        when 404
          raise Tookan::ErrorInExecution, data['message']
        when 200
          data
        end
      end
    end
  end
end
