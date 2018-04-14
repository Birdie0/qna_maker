module QnAMaker
  class Client
    #
    # Add or delete QnA Pairs and / or URLs to an existing knowledge base.
    #
    # @param [Array<Array(String, String)>] add \[question, answer\] data to be added to the knowledge base.
    # @param [Array<Array(String, String)>] delete \[question, answer\] data to be removed to the knowledge base.
    # @param [Array<String>] add_urls list of URLs to be processed and indexed in the knowledge base.
    #
    # @return [nil] on success
    #
    def update_kb(add: [], delete: [], add_urls: [])
      response = @http.patch(
        "#{BASE_URL}/#{@knowledgebase_id}",
        json: {
          add: {
            qnaPairs: add.map { |pair| { question: pair[0], answer: pair[1] } },
            urls: add_urls
          },
          delete: { qnaPairs: delete.map { |pair| { question: pair[0], answer: pair[1] } } }
        }
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
