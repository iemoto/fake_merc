require 'rails_helper'

RSpec.describe SellItemsController, type: :controller do
  let(:user) {create(:user)}
  let(:item) {create(:item)}
  let(:card) {create(:card, user_id: user.id)}
  let(:personal_user) {create(:personal_user, user_id: user.id)}
  # let(:params) {{id: item.id, card: card, item: item, personal: personal_user}}
  let(:params) {{id: item.id, item: item}}
  describe 'aaa' do
    context 'bbbb' do
      it 'hogehoge' do
        allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
        binding.pry
        get :show, params
        # get "transaction/buy/#{item.id}", params: {id: item.id, card: card}
        expect(response).to render_template :show
      end
    end
  end
# end
# end

end
