require 'spec_helper'

module Alchemy
  describe ".t" do
    it 'scopes translations intro alchemy namespace' do
      expect(::I18n).to receive(:t).with(:foo, default: 'Foo', scope: ['alchemy'])
      ::Alchemy.t(:foo)
    end
  end

  describe I18n do
    describe '.translation_files' do
      subject { I18n.translation_files }
      it      { is_expected.to be_a Array }
      it      { is_expected.to be_any { |f| f =~ /alchemy.*.yml/ } }
    end

    describe '.available_locales' do
      subject { I18n.available_locales }
      before  { allow(I18n).to receive(:translation_files).and_return(['alchemy.kl.yml']) }
      it      { is_expected.to be_a Array }
      it      { is_expected.to include :kl }

      context 'when locales are already set in @@available_locales' do
        before { I18n.class_variable_set(:@@available_locales, [:kl, :jp]) }
        it     { is_expected.to eq([:kl, :jp]) }
      end
    end

    describe '.available_locales=' do
      it "assigns the given locales to @@available_locales" do
        I18n.available_locales = [:kl, :nl, :cn]
        expect(I18n.class_variable_get(:@@available_locales)).to eq([:kl, :nl, :cn])
      end
    end
  end
end
