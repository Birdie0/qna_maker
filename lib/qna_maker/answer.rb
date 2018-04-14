module QnAMaker
  #
  # Answer class
  #
  class Answer
    attr_reader :answer, :questions, :score

    #
    # Creates an object for storing data about answer.
    #
    # @param [String] answer text
    # @param [Array<String>] questions list of questions for asked question
    # @param [Float] score probability that answer suits asked question
    #
    def initialize(answer, questions, score)
      @answer = answer
      @questions = questions
      @score = score
    end
  end
end
