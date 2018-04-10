module QnAMaker
  class Client
    def update_kb(add = [], delete = [], add_urls = [])
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
