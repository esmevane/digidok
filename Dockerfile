# From a basic Ubuntu install
FROM ubuntu

# Arrange tools to build Ruby
RUN apt-get update -qq &&\
    apt-get install -y build-essential curl g++ make git-core libssl-dev

# Build Ruby
WORKDIR /tmp
RUN git clone https://github.com/sstephenson/ruby-build.git
RUN cd ruby-build && ./install.sh
RUN ruby-build 2.1.1 /opt/2.1.1
ENV PATH $PATH:/opt/2.1.1/bin
RUN gem install bundler

# Create application directory
RUN mkdir /app
WORKDIR /app

# Bundle gems before application setup
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --deployment

# Copy over application
ADD . /app
EXPOSE 5000
