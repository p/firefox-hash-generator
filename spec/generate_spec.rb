describe FirefoxHashGenerator do
  describe '.generate' do
    let(:generated) do
      described_class.generate(app_name, profile_basename, search_engine_name)
    end

    let(:profile_basename) { 'created.default' }
    let(:search_engine_name) { 'DuckDuckGo' }

    context 'string app name' do
      let(:app_name) { 'Waterfox' }

      it 'generates the correct hash' do
        generated.should == 'OkBo8lGI144nYgxwn8G4qnLkk5/BTtbqwnfAglKoHug='
      end
    end

    context 'known symbol app name' do
      let(:app_name) { :waterfox }

      it 'generates the correct hash' do
        generated.should == 'OkBo8lGI144nYgxwn8G4qnLkk5/BTtbqwnfAglKoHug='
      end
    end

    context 'unknown symbol app name' do
      let(:app_name) { :bogusfox }

      it 'raises UnknownAppName' do
        lambda do
          generated
        end.should raise_error(FirefoxHashGenerator::UnknownAppName)
      end
    end
  end
end
