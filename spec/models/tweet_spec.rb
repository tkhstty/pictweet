require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが保存できる場合' do
      it '画像とテキストを投稿できる' do
        expect(@tweet).to be_valid
      end
      # it 'テキストのみで投稿できる' do
      #   @tweet.image = ''
      #   expect(@tweet).to be_valid
      # end
    end
    context 'ツイートが保存できない場合' do
      it 'テキストが空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "テキストを入力してください" 
      end
      it '画像が空では投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "画像を入力してください" 
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
