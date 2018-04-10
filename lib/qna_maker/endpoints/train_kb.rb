module QnAMaker
  class Client
    def train_kb(feedback_records = [])
      feedback_records = feedback_records.map do |record|
        { userId: record[0],
          userQuestion: record[1],
          kbQuestion: record[2],
          kbAnswer: record[3] }
      end
      response = @http.patch(
        "#{BASE_URL}/#{@knowledgebase_id}/train",
        json: { feedbackRecords: feedback_records }
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
