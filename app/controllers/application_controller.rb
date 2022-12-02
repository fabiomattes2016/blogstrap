class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:alert] = "Você não está autorizado a executar essa ação, fale com o administrador!"
        redirect_to(request.referrer || root_path)
    end
end
