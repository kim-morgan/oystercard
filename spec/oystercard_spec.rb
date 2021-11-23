require 'oystercard'
require 'journey'

describe Oystercard do
    let(:station) {double :station}
    let(:station2) {double :station2}

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

    it "should start off not in use" do
      expect(subject.in_journey?).to be nil
    end

    context "Sufficient funds" do
      before do
        @card = Oystercard.new
        @card.top_up(10)
      end

      it "should remember the entry station" do
        @card.touch_in(station)
        expect(@card.journey.entry_station).to eq station
      end

      xit "should forget entry station on touch out" do
        @card.touch_in(station)
        expect { @card.touch_out(station2) }.to change{ @card.entry_station }.from(station).to(nil)
      end

      xit "should remember a journey" do
        @card.touch_in(station)
        @card.touch_out(station2)
        journey = {}
        journey[station] = station2
        expect(@card.journey_history[0]).to eq(journey)
      end

      it "should create a new journey when touching in" do
        @card.touch_in(station)
        expect(@card.journey).to be_a_kind_of(Journey)
      end

      it "should deduct minimum fare when a journey is complete" do
        @card.touch_in(station)
        @card.touch_out(station2)
        expect(@card.balance).to eq 9
      end

      it "should update exit station when touching out" do
        @card.touch_in(station)
        @card.touch_out(station2)
        expect(@card.journey.exit_station).to eq station2
      end

    end

   it "should have a minimum fare of £1" do
      expect{subject.touch_in(station)}.to raise_error 'Insufficient funds, minimum fare is £#{Journey::MINIMUM_FARE}'
    end
end