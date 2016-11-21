module Private::Withdraws
  class OperasController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
