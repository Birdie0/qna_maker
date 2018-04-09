module QnAMaker
  class Alteration
    attr_reader :word, :alterations

    def initialize(word, alterations)
      @word = word
      @alterations = alterations
    end
  end
end
