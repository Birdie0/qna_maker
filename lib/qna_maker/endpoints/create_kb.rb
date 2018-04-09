module QnAMaker
  class Client
    def create_kb(name, qna_pairs = [], urls = [])
      response = @http.post(
        "#{BASE_URL}/create",
        json: {
          name: name,
          qnaPairs: qna_pairs.map { |pair| { question: pair[0], answer: pair[1] } },
          urls: urls
        }
      )

      case response.code
      when 201
        QnA.new(
          response.parse['kbId'],
          @subscription_key,
          response.parse['dataExtractionResults']
        )
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      else
        raise UnknownError, 'Oh no!'
      end
    end

    def self.create_kb(name, subscription_key, qna_pairs = [], urls = [])
      response = HTTP.headers('Ocp-Apim-Subscription-Key' => subscription_key).post(
        "#{BASE_URL}/create",
        json: {
          name: name,
          qnaPairs: qna_pairs.map { |pair| { question: pair[0], answer: pair[1] } },
          urls: urls
        }
      )

      case response.code
      when 201
        QnA.new(
          response.parse['kbId'],
          subscription_key,
          response.parse['dataExtractionResults']
        )
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      else
        raise UnknownError, 'Oh no!'
      end
    end
  end
end
