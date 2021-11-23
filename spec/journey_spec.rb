require 'journey'
require 'oystercard'

describe Journey do
    context "initialize" do
        before do
            @journey = Journey.new("Aldgate")
        end
        it "should have a name" do
            expect(@journey.entry_station).to eq "Aldgate"
        end
        
        it "should not have an exit station" do 
            expect(@journey.exit_station).to eq nil
        end

    end

    it "should know when a journey is complete" do
        journey = Journey.new("station")
        journey.exit_station("station2")
        expect(journey.complete?).to be true
    end

    it "should know when a journey is not complete" do
        journey = Journey.new("station")
        expect(journey.complete?).to be false
    end

    context "calculate fare" do
        it "should calculate minimum fare if journey is complete " do
            journey = Journey.new("station")
            journey.exit_station("station2")
            expect(journey.fare).to eq Journey::MINIMUM_FARE
        end 

        it "should calculate penalty fare if journey is incomplete" do
            journey = Journey.new("station")
            expect(journey.fare).to eq Journey::PENALTY_FARE
        end
    end
end