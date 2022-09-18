class Customers::HomesController < ApplicationController
  def guest_sign_in
    #ゲストユーザーを削除されてゲスト機能が動作しなくなるリスクを回避
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      #パスワード等の情報変更を防ぐ
      customer.password = SecureRandom.urlsafe_base64
      #customer.name = "ゲスト"

    end
    sign_in customer
    redirect_to customers_root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
