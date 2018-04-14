module QnAMaker
  class Client
    #
    # Creates a new knowledge base.
    #
    # @param [String] name friendly name for the knowledge base (Required)
    # @param [Array<Array(String, String)>] qna_pairs list of question and answer pairs to be added to the knowledge base.
    #   Max 1000 Q-A pairs per request.
    # @param [Array<String>] urls list of URLs to be processed and indexed in the knowledge base.
    #   In case of existing URL, it will be fetched again and KB will be updated with new data. Max 5 urls per request.
    #
    # @return [Client] client object
    #
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
        QnAMaker::Client.new(
          response.parse['kbId'],
          @subscription_key,
          response.parse['dataExtractionResults']
        )
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end

    #
    # Creates a new knowledge base.
    #
    # @param [String] name friendly name for the knowledge base (Required)
    # @param [String] subscription_key Subscription key which provides access to
    #   this API. Found in your QnAMaker Service accounts (https://qnamaker.ai)
    # @param [Array<Array(String, String)>] qna_pairs list of question and
    #   answer pairs to be added to the knowledge base. Max 1000 Q-A pairs per
    #   request.
    # @param [Array<String>] urls list of URLs to be processed and indexed in
    #   the knowledge base. In case of existing URL, it will be fetched again
    # and KB will be updated with new data. Max 5 urls per request.
    #
    # @return [Client] client object
    #
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
        QnAMaker::Client.new(
          response.parse['kbId'],
          subscription_key,
          response.parse['dataExtractionResults']
        )
      when 400
        raise BadArgumentError, response.parse['error']['message'].join(' ')
      when 401
        raise UnauthorizedError, response.parse['error']['message']
      else
        raise UnknownError, "Oh no! (#{response.code})"
      end
    end
  end
end
