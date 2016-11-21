module Admin
  module Withdraws
    class OperasController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Opera'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_operas = @operas.with_aasm_state(:accepted).order("id DESC")
        @all_operas = @operas.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @opera.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @opera.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
