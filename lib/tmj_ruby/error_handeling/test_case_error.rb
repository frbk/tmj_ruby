require_relative '../helpers/base_error'

module TMJ
  class TestCaseError < TMJ::BaseError
    attr_reader :message

    def initialize(response)
      @response = response
      @message = case response.code
                 when 400 then raise_400
                 when 401 then raise_401
                 when 404 then raise_404
                 end
    end

    def raise_400
      'Some parameters are invalid or not found.'
    end

    def raise_404
      'No Test Case has been found with the given key.'
    end
  end
end
