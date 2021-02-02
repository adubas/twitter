# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Criando uma postagem no twitter', type: :request do
  context '#create_post' do
    subject do
      post v1_twitter_post_path, params: parametros
    end

    let!(:forecast) do
      ['26.87°C em 2021-02-02', '26.27°C em 2021-02-02', '25.81°C em 2021-02-02', '28.89°C em 2021-02-02',
       '29.85°C em 2021-02-02']
    end

    let!(:tweet) { 'id: 12342423' }

    before do
      allow_any_instance_of(GetWeather).to receive(:current).and_return('28')
      allow_any_instance_of(GetWeather).to receive(:forecast).and_return(forecast)
      allow_any_instance_of(PostService).to receive(:call).and_return(tweet)
    end

    let(:parametros) do
      {
        twitter: {
          user: '12312312q32e3asdsa',
          token: '1231312adsasda',
          city: 'santos'
        }
      }
    end

    it 'retorna o sucesso' do
      subject

      expect(response).to have_http_status 204
    end
  end
end
