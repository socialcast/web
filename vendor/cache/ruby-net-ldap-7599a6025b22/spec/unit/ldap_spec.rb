require 'spec_helper'

describe Net::LDAP::Connection do
  describe "initialize" do
    context "when host is not responding" do
      before(:each) do
        flexmock(TCPSocket).
          should_receive(:new).and_raise(Errno::ECONNREFUSED)
      end

      it "should raise LdapError" do
        lambda {
          Net::LDAP::Connection.new(
            :server => 'test.mocked.com',
            :port   => 636)
        }.should raise_error(Net::LDAP::LdapError)
      end
    end
    context "when host is blocking the port" do
      before(:each) do
        flexmock(TCPSocket).
          should_receive(:new).and_raise(SocketError)
      end

      it "should raise LdapError" do
        lambda {
          Net::LDAP::Connection.new(
            :server => 'test.mocked.com',
            :port   => 636)
        }.should raise_error(Net::LDAP::LdapError)
      end
    end
    context "on other exceptions" do
      before(:each) do
        flexmock(TCPSocket).
          should_receive(:new).and_raise(NameError)
      end

      it "should rethrow the exception" do
        lambda {
          Net::LDAP::Connection.new(
            :server => 'test.mocked.com',
            :port   => 636)
        }.should raise_error(NameError)
      end
    end
  end
  describe "wrap_with_ssl" do
    before(:each) do
        @conn = flexmock(TCPSocket).should_receive(:new).and_return(flexmock('tcpsocket'))
        @ssl_con = flexmock('sslsocket')
        @ssl_con.should_receive(:connect)
        @ssl_con.should_receive(:sync_close=)
        flexmock(OpenSSL::SSL::SSLSocket).should_receive(:new).and_return(@ssl_con)
      end
    it "allows no options to be passed" do
      flexmock(OpenSSL::SSL::SSLContext).new_instances.should_receive(:ssl_version=).never
      Net::LDAP::Connection.wrap_with_ssl(@conn).should eql(@ssl_con)
    end
    it "allows options to be passed" do
      flexmock(OpenSSL::SSL::SSLContext).new_instances.should_receive(:ssl_version=).never
      Net::LDAP::Connection.wrap_with_ssl(@conn, {}).should eql(@ssl_con)
    end
    it "communicates over the ssl_version configured" do
      flexmock(OpenSSL::SSL::SSLContext).new_instances.should_receive(:ssl_version=).with(:SSLv3)
      Net::LDAP::Connection.wrap_with_ssl(@conn, {:ssl_version => :SSLv3}).should eql(@ssl_con)
    end
  end
end
