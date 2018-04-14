module QnAMaker
  class Client
    #
    # Deletes the current knowledge base and all data associated with it.
    #
    # @return [nil] on success
    #
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
        raise ForbiddenError, response.parse['error']['message']
      when 404
        raise NotFoundError, response.parse['error']['message']
      when 409
        raise ConflictError, response.parse['error']['message']
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end

    #
    # Deletes the specified knowledge base and all data associated with it.
    #
    # @param [String] knowledgebase_id knowledge base identity
    # @param [String] subscription_key Subscription key which provides access to
    #   this API. Found in your QnAMaker Service accounts (https://qnamaker.ai)
    #
    # @return [nil] on success
    #
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
        raise ForbiddenError, response.parse['error']['message']
      when 404
        raise NotFoundError, response.parse['error']['message']
      when 409
        raise ConflictError, response.parse['error']['message']
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end
  end
end
