module QnAMaker
  class Error < StandardError
  end

  class BadArgumentError < Error
  end

  class NotFoundError < Error
  end

  class UnauthorizedError < Error
  end

  class QuotaExceededError < Error
  end

  class OperationTimeOutError < Error
  end

  class RateLimitExceededError < Error
  end

  class ConflictError < Error
  end

  class ForbiddenError < Error
  end

  class UnknownError < Error
  end
end
