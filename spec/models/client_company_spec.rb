# frozen_string_litteral: true
require "rails_helper"

describe "クライアント企業モデルのテスト" do
  it "有効な投稿の場合は保存されるか" do
    expect(FactoryBot.build(:client_company)).to be_valid
  end
end