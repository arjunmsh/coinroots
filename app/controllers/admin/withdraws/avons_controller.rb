module Admin
  module Withdraws
    class AvonsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Avon'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_avons = @avons.with_aasm_state(:accepted).order("id DESC")
        @all_avons = @avons.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @avon.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @avon.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
