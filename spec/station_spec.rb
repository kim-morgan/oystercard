require 'station'

describe Station do
    context "initialize" do
        before do
            @station = Station.new("Aldgate", 1)
        end
        it "should have a name" do
            expect(@station.name).to eq "Aldgate"
        end

        it "should have a zone" do
            expect(@station.zone).to eq 1
        end
    end
end