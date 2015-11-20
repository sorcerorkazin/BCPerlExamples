#!/usr/bin/perl
use cPanelUserConfig;
use CGI qw(:standard);
use LWP::UserAgent;
use JSON qw( decode_json );

$authToken = "4wzjyajzuwrb6cupfz0ikv2p2ntrr0w";
$clientID = "";
$url = 'https://api.bigcommerce.com/stores/ffzoin/v2/brands/207';
@headers = (
    'Accept' => 'application/json',
    'Content-Type' => 'application/json',
    'X-Auth-Client' => $clientID,
    'X-Auth-Token' => $authToken
    );
    

#we are going to get a list of products
$userAgent = LWP::UserAgent->new;
$response = $userAgent->delete($url,@headers);
#$jsonContent = decode_json($response->decoded_content());
print header(-type => 'text/plain');
print $response->decoded_content();
print $jsonContent;