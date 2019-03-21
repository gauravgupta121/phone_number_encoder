RSpec.describe PhoneNumberEncoder::NumberEncoder do

  describe 'Instance Methods' do

    describe '#encoded_words' do

      it 'should not accept invalid numbers' do
        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(66867878.25)
        ).to eq 'Please input correct Number'

        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words('6686787825')
        ).to eq 'Please input correct Number'

        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(nil)
        ).to eq 'Please input correct Number'

        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(-6686787825)
        ).to eq 'Please input correct Number'

        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(123456789)
        ).to eq 'Please input correct Number'

        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(6686787825)
        ).not_to eq 'Please input correct Number'
      end

      it 'should return possible words' do
        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(6686787825)
        ).to match_array([["MOT", "OPT", "PUCK"], ["MOT", "OPT", "RUCK"], ["MOT", "OPT", "SUCK"], ["MOT", "ORT", "PUCK"], ["MOT", "ORT", "RUCK"], ["MOT", "ORT", "SUCK"], ["NOT", "OPT", "PUCK"], ["NOT", "OPT", "RUCK"], ["NOT", "OPT", "SUCK"], ["NOT", "ORT", "PUCK"], ["NOT", "ORT", "RUCK"], ["NOT", "ORT", "SUCK"], ["OOT", "OPT", "PUCK"], ["OOT", "OPT", "RUCK"], ["OOT", "OPT", "SUCK"], ["OOT", "ORT", "PUCK"], ["OOT", "ORT", "RUCK"], ["OOT", "ORT", "SUCK"], ["MOT", "OPTS", "TAJ"], ["MOT", "OPUS", "TAJ"], ["MOT", "ORTS", "TAJ"], ["NOT", "OPTS", "TAJ"], ["NOT", "OPUS", "TAJ"], ["NOT", "ORTS", "TAJ"], ["OOT", "OPTS", "TAJ"], ["OOT", "OPUS", "TAJ"], ["OOT", "ORTS", "TAJ"], ["NOUN", "PUP", "TAJ"], ["NOUN", "PUR", "TAJ"], ["NOUN", "PUS", "TAJ"], ["NOUN", "SUP", "TAJ"], ["NOUN", "SUQ", "TAJ"], ["ONTO", "PUP", "TAJ"], ["ONTO", "PUR", "TAJ"], ["ONTO", "PUS", "TAJ"], ["ONTO", "SUP", "TAJ"], ["ONTO", "SUQ", "TAJ"], ["NOUN", "STRUCK"], ["ONTO", "STRUCK"], ["MOTOR", "TRUCK"], ["MOTOR", "USUAL"], ["NOUNS", "TRUCK"], ["NOUNS", "USUAL"], ["MOTORTRUCK"]])

        expect(
          PhoneNumberEncoder::NumberEncoder.new.encoded_words(2282668687)
        ).to match_array([["ACT", "BOO", "TOTS"], ["ACT", "BOO", "TOUR"], ["ACT", "CON", "TOTS"], ["ACT", "CON", "TOUR"], ["ACT", "COO", "TOTS"], ["ACT", "COO", "TOUR"], ["BAT", "BOO", "TOTS"], ["BAT", "BOO", "TOUR"], ["BAT", "CON", "TOTS"], ["BAT", "CON", "TOUR"], ["BAT", "COO", "TOTS"], ["BAT", "COO", "TOUR"], ["CAT", "BOO", "TOTS"], ["CAT", "BOO", "TOUR"], ["CAT", "CON", "TOTS"], ["CAT", "CON", "TOUR"], ["CAT", "COO", "TOTS"], ["CAT", "COO", "TOUR"], ["ACT", "BOOT", "MUS"], ["ACT", "BOOT", "NUS"], ["ACT", "BOOT", "OUR"], ["ACT", "COOT", "MUS"], ["ACT", "COOT", "NUS"], ["ACT", "COOT", "OUR"], ["BAT", "BOOT", "MUS"], ["BAT", "BOOT", "NUS"], ["BAT", "BOOT", "OUR"], ["BAT", "COOT", "MUS"], ["BAT", "COOT", "NUS"], ["BAT", "COOT", "OUR"], ["CAT", "BOOT", "MUS"], ["CAT", "BOOT", "NUS"], ["CAT", "BOOT", "OUR"], ["CAT", "COOT", "MUS"], ["CAT", "COOT", "NUS"], ["CAT", "COOT", "OUR"], ["ACTA", "MOT", "MUS"], ["ACTA", "MOT", "NUS"], ["ACTA", "MOT", "OUR"], ["ACTA", "NOT", "MUS"], ["ACTA", "NOT", "NUS"], ["ACTA", "NOT", "OUR"], ["ACTA", "OOT", "MUS"], ["ACTA", "OOT", "NUS"], ["ACTA", "OOT", "OUR"], ["ACT", "AMOUNTS"], ["ACT", "CONTOUR"], ["BAT", "AMOUNTS"], ["BAT", "CONTOUR"], ["CAT", "AMOUNTS"], ["CAT", "CONTOUR"], ["ACTA", "MOUNTS"], ["CATAMOUNTS"]])
      end

    end

  end

end