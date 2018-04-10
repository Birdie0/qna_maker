require 'qna_maker/version'

require 'qna_maker/alteration'
require 'qna_maker/answer'
require 'qna_maker/errors'
require 'qna_maker/string'

require 'qna_maker/endpoints/create_kb'
require 'qna_maker/endpoints/delete_kb'
require 'qna_maker/endpoints/download_alterations'
require 'qna_maker/endpoints/download_kb'
require 'qna_maker/endpoints/generate_answer'
require 'qna_maker/endpoints/publish_kb'
require 'qna_maker/endpoints/train_kb'
require 'qna_maker/endpoints/update_kb'
require 'qna_maker/endpoints/update_alterations'

require 'http'

module QnAMaker
  class Client
    BASE_URL = 'https://westus.api.cognitive.microsoft.com/QnAMaker/v2.0/knowledgebases'.freeze

    attr_reader :knowledgebase_id, :subscription_key, :data_extraction_results

    def initialize(knowledgebase_id, subscription_key, data_extraction_results = [])
      @knowledgebase_id = knowledgebase_id
      @subscription_key = subscription_key
      @data_extraction_results = data_extraction_results
      @http = HTTP.headers('Ocp-Apim-Subscription-Key' => @subscription_key)
    end
  end
end
