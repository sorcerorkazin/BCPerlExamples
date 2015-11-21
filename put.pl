#!/usr/bin/perl
use cPanelUserConfig;
use CGI qw(:standard);
use LWP::UserAgent;
use HTTP::Request;
use JSON qw( decode_json );

$authToken = "";
$clientID = "";
$url = 'https://api.bigcommerce.com/stores/ffzoin/v2/products/25000';
@headers = (
    'Accept' => 'application/json',
    'Content-Type' => 'application/json',
    'X-Auth-Client' => $clientID,
    'X-Auth-Token' => $authToken
    );
$update = "{\"name\":\"THIS IS A TEST FOR THE PERL PUT\"}";

#set up the request
$req = HTTP::Request->new("PUT", $url);
$req->header(@headers);
$req->content($update);


#we are going to get a list of products
$userAgent = LWP::UserAgent->new;
$response = $userAgent->request($req);
#$jsonContent = decode_json($response->decoded_content());
print header(-type => 'text/plain');
print $response->decoded_content();
print $jsonContent;