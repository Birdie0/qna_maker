module QnAMaker
  class BadArgumentError < StandardError
  end

  class NotFoundError < StandardError
  end

  class UnauthorizedError < StandardError
  end

  class QuotaExceededError < StandardError
  end

  class OperationTimeOutError < StandardError
  end

  class RateLimitExceededError < StandardError
  end

  class ConflictError < StandardError
  end

  class UnknownError < StandardError
  end
end
