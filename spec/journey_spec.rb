require 'journey'

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
end