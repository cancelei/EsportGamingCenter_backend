require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  # GET /api/reservations
  path '/api/reservations' do
    get('list reservations') do
      tags 'Reservations'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   game_id: { type: :integer },
                   user_id: { type: :integer },
                   reservation_date: { type: :string, format: 'date' },
                   setup_config: { type: :string },
                   platform: { type: :string },
                   status: { type: :string }
                 }
               }

        run_test!
      end
    end
  end

  # POST /api/reservations
  path '/api/reservations' do
    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          game_id: { type: :integer },
          reservation_date: { type: :string, format: 'date' },
          setup_config: { type: :string },
          platform: { type: :string },
          status: { type: :string }
        },
        required: %w[game_id reservation_date setup_config platform status]
      }

      response(201, 'reservation created') do
        let(:reservation) do
          { game_id: 1, reservation_date: '2023-01-01', setup_config: 'PC', platform: 'PC', status: 'Pending' }
        end
        run_test!
      end

      response(422, 'invalid request') do
        let(:reservation) { { game_id: nil } }
        run_test!
      end
    end
  end

  # /api/reservations/{id}
  path '/api/reservations/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    # GET /api/reservations/{id}
    get('show reservation') do
      tags 'Reservations'
      produces 'application/json'

      response(200, 'successful') do
        let(:id) { 1 }
        run_test!
      end
    end

    # PATCH/PUT /api/reservations/{id}
    patch('update reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation_date: { type: :string, format: 'date' },
          setup_config: { type: :string },
          platform: { type: :string },
          status: { type: :string }
        }
      }

      response(200, 'successful') do
        let(:id) { 1 }
        let(:reservation) do
          { reservation_date: '2023-01-02', setup_config: 'Updated Config', platform: 'Xbox', status: 'Confirmed' }
        end
        run_test!
      end
    end

    # DELETE /api/reservations/{id}
    delete('delete reservation') do
      tags 'Reservations'

      response(204, 'successful') do
        let(:id) { 1 }
        run_test!
      end
    end
  end
end
