# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Monta a postagem corretamente twitter', type: :request do
  context '#create_post' do
    subject do
      PostService.new(parametros).compose_tweet
    end

    let!(:forecast) do
      ['26.87°C em 2021-02-02', '26.27°C em 2021-02-02', '25.81°C em 2021-02-02', '28.89°C em 2021-02-02',
       '29.85°C em 2021-02-02']
    end

    before do
      allow_any_instance_of(GetWeather).to receive(:current).and_return('28')
      allow_any_instance_of(GetWeather).to receive(:forecast).and_return(forecast)
    end

    let(:parametros) do
      {
        user: '12312312q32e3asdsa',
        token: '1231312adsasda',
        city: 'santos'
      }
    end

    let(:retorno_esperado) do
      'Na cidade de santos, a temperatura é de 28°C e a previsão para os próximos dias é de ' \
        '26.87°C em 2021-02-02, 26.27°C em 2021-02-02, 25.81°C em 2021-02-02, ' \
        '28.89°C em 2021-02-02 e 29.85°C em 2021-02-02.'
    end

    it 'retorna o sucesso' do
      expect(subject).to eq retorno_esperado
    end
  end
end
