module QnAMaker
  class Client
    def delete_kb
      response = @http.delete(
        "#{BASE_URL}/#{knowledgebase_id}"
      )

      case response.code
      when 204
        nil
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      when 403
        raise QuotaExceededError, response.parse['error']['message'].join(' ')
      when 404
        raise NotFoundError, response.parse['error']['message'].join(' ')
      when 409
        raise ConflictError, response.parse['error']['message'].join(' ')
      else
        raise UnknownError, 'Oh no!'
      end
    end

    def self.delete_kb(knowledgebase_id, subscription_key)
      response = HTTP.headers('Ocp-Apim-Subscription-Key' => subscription_key).delete(
        "#{BASE_URL}/#{knowledgebase_id}"
      )

      case response.code
      when 204
        nil
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      when 403
        raise QuotaExceededError, response.parse['error']['message'].join(' ')
      when 404
        raise NotFoundError, response.parse['error']['message'].join(' ')
      when 409
        raise ConflictError, response.parse['error']['message'].join(' ')
      else
        raise UnknownError, 'Oh no!'
      end
    end
  end
end
