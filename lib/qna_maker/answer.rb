module QnAMaker
  class Answer
    attr_reader :answer, :questions, :score

    def initialize(answer, questions, score)
      @answer = answer
      @questions = questions
      @score = score
    end
  end
end
