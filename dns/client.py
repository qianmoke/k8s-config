import argparse
import requests
import socket

from urlparse import urlparse


def CheckServiceAddress(address):
  hostname = urlparse(address).hostname
  service_address = socket.gethostbyname(hostname)
  print service_address


def GetServerResponse(address):
  print 'Send request to:', address
  response = requests.get(address)
  print response
  print response.content


def Main():
  parser = argparse.ArgumentParser()
  parser.add_argument('address')
  args = parser.parse_args()
  CheckServiceAddress(args.address)
  GetServerResponse(args.address)


if __name__ == "__main__":
  Main()

