#!/usr/bin/perl
use cPanelUserConfig;
use CGI qw(:standard);
use LWP::UserAgent;
use JSON qw( decode_json );

$authToken = "";
$clientID = "";
$url = 'https://api.bigcommerce.com/stores/ffzoin/v2/products';
@headers = (
    'Accept' => 'application/json',
    'Content-Type' => 'application/json',
    'X-Auth-Client' => $clientID,
    'X-Auth-Token' => $authToken
    );
    

#we are going to get a list of products
$userAgent = LWP::UserAgent->new;
$response = $userAgent->get($url,@headers);
#$jsonContent = decode_json($response->decoded_content());
print header(-type => 'text/plain');
print $response->decoded_content();
print $jsonContent;