# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # ログイン成功した場合
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
end
