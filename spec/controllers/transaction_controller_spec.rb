# require 'rails_helper'
# describe '商品購入', type: :controller do
#   let(:user) {create(:user)}
#   let(:card) {create(:card, user_id: user.id)}
#   describe 'aaa' do
#     context 'bbbb' do
#       before do
#         login user
#       end
#       it 'hogehoge' do
#         allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
#         item = create(:item)
#         get :show, params: {id: item.id, card: card}
#         expect(response).to render_template :show
#       end
#     end
#   end
# end
