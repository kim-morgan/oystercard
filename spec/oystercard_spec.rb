require 'oystercard'
describe Oystercard do
    it "should have a balance of 0 when initialized" do
        expect(subject.balance).to eq 0
    end

    it "should be able to top up money" do
        card = Oystercard.new
        card.top_up(10)
        expect(card.balance).to eq 10
    end
end