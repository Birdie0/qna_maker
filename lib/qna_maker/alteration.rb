module QnAMaker
  #
  # Alteration class
  #
  class Alteration
    # @!attribute [r] word
    #   @return [String] word of alteration
    attr_reader :word
    # @!attribute [r] alterations
    #   @return [Array<Alteration>] list of alterations for word
    attr_reader :alterations

    #
    # Creates an object for alteration.
    #
    # @param [String] word
    # @param [Array<Alteration>] alterations list of alterations
    #
    def initialize(word, alterations)
      @word = word
      @alterations = alterations
    end
  end
end
