module Private
  module Deposits
    class AvonsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
