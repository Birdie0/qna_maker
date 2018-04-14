module QnAMaker
  class Client
    #
    # Returns the list of answers for the given question sorted in descending
    # order of ranking score.
    #
    # @param [String] question user question to be queried against your
    #   knowledge base.
    # @param [Integer] top number of ranked results you want in the output.
    #
    # @return [Array<Answer>] list of answers for the user query sorted in
    #   decreasing order of ranking score.
    #
    def generate_answer(question, top = 1)
      response = @http.post(
        "#{BASE_URL}/#{@knowledgebase_id}/generateAnswer",
        json: { question: question, top: top }
      )

      case response.code
      when 200
        response.parse['answers'].map do |answer|
          Answer.new(
            answer['answer'].normalize,
            answer['questions'].map(&:normalize),
            answer['score']
          )
        end
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      when 403
        raise QuotaExceededError, response.parse['error']['message']
      when 404
        raise NotFoundError, response.parse['error']['message']
      when 408
        raise OperationTimeOutError, response.parse['error']['message']
      when 429
        raise RateLimitExceededError, response.parse['error']['message']
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end
  end
end
