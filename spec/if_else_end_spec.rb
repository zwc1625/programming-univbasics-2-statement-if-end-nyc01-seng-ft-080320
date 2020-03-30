require 'spec_helper'
describe 'lib/if_else_end.rb' do
  it 'should output "Even!" if the current second is an even number' do
    stub_time = Time.at(1582639668)
    file = Dir.pwd + "/lib/if_else_end.rb"
    allow(Time).to receive(:new).and_return(stub_time)
    allow(Time).to receive(:now).and_return(stub_time)
    expect{ load file }.to output(/Even!/).to_stdout
  end

  it 'should output "Odd!" if the current second is an odd number' do
    stub_time = Time.at(1582639667)
    file = Dir.pwd + "/lib/if_else_end.rb"
    allow(Time).to receive(:new).and_return(stub_time)
    allow(Time).to receive(:now).and_return(stub_time)
    expect{ load file }.to output(/Odd!/).to_stdout
  end
end