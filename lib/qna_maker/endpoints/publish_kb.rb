module QnAMaker
  class Client
    def publish_kb
      response = @http.put(
        "#{BASE_URL}/#{@knowledgebase_id}"
      )

      case response.code
      when 204
        nil
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      when 404
        raise NotFoundError, response.parse['error']['message'].join(' ')
      when 403
        raise QuotaExceededError, response.parse['error']['message'].join(' ')
      when 409
        raise ConflictError, response.parse['error']['message'].join(' ')
      else
        raise UnknownError, 'Oh no!'
      end
    end
  end
end