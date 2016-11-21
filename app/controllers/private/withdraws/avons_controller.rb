module Private::Withdraws
  class AvonsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
