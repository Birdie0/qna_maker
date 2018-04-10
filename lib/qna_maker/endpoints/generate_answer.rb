module QnAMaker
  class Client
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
