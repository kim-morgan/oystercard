require 'oystercard'
describe Oystercard do
    it "should have a balance of 0 when initialized" do
        expect(subject.balance).to eq 0
    end

    it "should be able to top up money" do
        subject.top_up(10)
        expect(subject.balance).to eq 10
    end

    it "should fail if user try to top_up more than £90" do
        expect { subject.top_up(91)}.to raise_error 'can not top up more than £#{BALANCE_LIMIT}'
    end

end