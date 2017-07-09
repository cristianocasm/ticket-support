require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  

  describe "customer" do
    let(:customer) { create(:customer) }
    let(:valid_attributes) { attributes_for(:ticket) }
    let(:invalid_attributes) { {title: nil} }

    before do
      @request.headers['X-User-Email'] = customer.email
      @request.headers['X-User-Token'] = customer.authentication_token
    end
    
    describe "POST #create" do
      context "with valid params" do
        it "creates a new Ticket" do
          expect {
            post :create, params: {ticket: valid_attributes}
          }.to change(Ticket, :count).by(1)
        end

        it "renders a JSON response with the new ticket" do
          post :create, params: {ticket: valid_attributes}
          expect(response).to have_http_status(:created)
          expect(response.content_type).to eq('application/json')
          expect(response.location).to eq(ticket_url(Ticket.last))
        end

        it "assigns current_user to customer_id" do
          post :create, params: {ticket: valid_attributes}
          expect(JSON.parse(response.body)["customer_id"]).to eq(customer.id)
        end
      end

      context "with invalid params" do
        it "renders a JSON response with errors for the new ticket" do
          post :create, params: {ticket: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end

  describe "general user" do
    let(:agent) { create(:agent) }
    let(:new_attributes) { { agent_id: agent.id, close: true } }

    before do
      @request.headers['X-User-Email'] = agent.email
      @request.headers['X-User-Token'] = agent.authentication_token

      1.times { create(:ticket, agent: agent) }
      2.times { create(:ticket) }
    end
    
    describe "PUT #update" do
      let(:ticket) { create(:ticket) }

      context "with valid params" do
        it "updates the requested ticket" do
          put :update, params: {id: ticket.to_param, ticket: new_attributes}
          ticket.reload
          expect(ticket.agent_id).to eq(agent.id)
          expect(ticket.closed_at).to eq(Date.current)
        end

        it "renders a JSON response with the ticket" do
          put :update, params: {id: ticket.to_param, ticket: new_attributes}
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to eq('application/json')
        end
      end
    end

    describe "GET #index" do
      it "returns user's tickets only" do
        get :index
        expect(JSON.parse(response.body).count).to eq 1
      end
    end
  end
end
