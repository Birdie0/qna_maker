module QnAMaker
  class Client
    #
    # Downloads all the data associated with the specified knowledge base
    #
    # @return [String] SAS url (valid for 30 mins) to tsv file in blob storage
    #
    def download_kb
      response = @http.get(
        "#{BASE_URL}/#{@knowledgebase_id}"
      )

      case response.code
      when 200
        response.parse
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      when 403
        raise ForbiddenError, response.parse['error']['message'].join(' ')
      when 404
        raise NotFoundError, response.parse['error']['message'].join(' ')
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end
  end
end
