module QnAMaker
  class Client
    #
    # Replaces word alterations (synonyms) for the KB with the give records.
    #
    # @param [Array(String, Array<String>)] add word alterations to be added
    # @param [Array(String, Array<String>)] delete word alterations to be removed
    #
    # @return [nil] on success
    #
    def update_alterations(add = [], delete = [])
      response = @http.patch(
        "#{BASE_URL}/#{@knowledgebase_id}/updateAlterations",
        json: { add: add.map {|i| {word: i[0], alterations: i[1]} },
        delete: delete.map {|i| {word: i[0], alterations: i[1]} } }
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
