module QnAMaker
  class Client
    #
    # Downloads all word alterations (synonyms) that have been automatically
    #   mined or added by the user.
    #
    # @return [Array<Alteration>] list of alterations
    #
    def download_alterations
      response = @http.get(
        "#{BASE_URL}/#{@knowledgebase_id}/downloadAlterations"
      )

      case response.code
      when 200
        response.parse['wordAlterations'].map do |alteration|
          Alteration.new(
            alteration['word'].normalize,
            alteration['alterations'].map(&:normalize)
          )
        end
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      when 403
        raise ForbiddenError, response.parse['error']['message']
      when 404
        raise NotFoundError, response.parse['error']['message']
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end
  end
end
