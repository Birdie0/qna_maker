module QnAMaker
  class Client
    def update_alterations(add = [], delete = [])
      response = @http.patch(
        "#{BASE_URL}/#{@knowledgebase_id}/updateAlterations",
        json: { add: add, delete: delete }
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
