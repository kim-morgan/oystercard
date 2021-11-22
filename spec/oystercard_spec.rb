require 'oystercard'
describe Oystercard do
    it "should have a balance of 0 when initialized" do
        expect(subject.balance).to eq 0
    end

    it "should be able to top up money" do
        subject.top_up(10)
        expect(subject.balance).to eq 10
    end
end