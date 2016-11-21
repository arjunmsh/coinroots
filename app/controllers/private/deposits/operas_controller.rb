module Private
  module Deposits
    class OperasController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
