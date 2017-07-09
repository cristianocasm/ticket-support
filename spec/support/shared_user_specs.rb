shared_examples_for "a user model" do
  it 'is an user' do
    expect(model.class.superclass).to be User
  end

  it 'has authentication token value set after creation' do
    expect(model.authentication_token).not_to be_nil
  end

  it 'returns its type' do
    type = JSON.parse(model.to_json)["type"]

    expect(type) == model.class
  end
end
