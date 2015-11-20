#!/usr/bin/perl
use cPanelUserConfig;

use CGI qw(:standard);
use LWP::UserAgent;
use JSON qw( decode_json );
use DBI;

$query = CGI->new();
#superUser
#$clientID = "d653xcrai0r5guzcunkt1aexler0mxk";
#$clientSecret = "";

#regularUser
#$clientID = "96o2ncqvyf1kr4a8q1cbsbskyxqetlc";
#$clientSecret = "";

#patrick
$clientID = "q48e88zka0bun04xwy0pptmu83yl5i6";
$clientSecret = "";

$code = $query->param('code');
$scope = $query->param('scope');
$grantType = 'authorization_code';
$redirectURL = ""; #make sure this is the same as the Auth Callback
$context = $query->param('context');

#This is only if you want to save to a DB
#$db = "sevillas_escalationstool";
#$host = "localhost";
#$user = "sevillas_admin";
#$password = '';
#$dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host", $user, $password) or die "Can't connect to database: $DBI::errstr\n";


print header(-type => 'text/plain');
print "Client ID \= $clientID\n";
print "Client Secret \= \n";
print "Code = $code\n";
print "Scope = $scope\n";
print "Grant Type = $grantType\n";
print "Redirect URL = $redirectURL\n";
print "Context = $context\n";

print "-----Sending in request-----\n";
$userAgent = LWP::UserAgent->new;
$authenticationServer = "https://login.bigcommerce.com/oauth2/token";
$response = $userAgent->post($authenticationServer, {
                              'client_id' => $clientID,
                              'client_secret' => $clientSecret,
                              'code' => $code,
                              'scope' => $scope,
                              'grant_type' => $grantType,
                              'redirect_uri' => $redirectURL,
                              'context' => $context});
$content = $response->decoded_content();
$jsonObject = decode_json($content);
print "User ID: ".$jsonObject->{'user'}{'id'}."\n";
print "User Email: ".$jsonObject->{'user'}{'email'}."\n";
print "Client ID: ".$clientID."\n";
print "Auth token: ".$jsonObject->{'access_token'}."\n";
print "Store Hash: ".$jsonObject->{'context'}."\n";
print "Scope: ".$jsonObject->{'scope'}."\n";
#userID, userEmail, #apiToken, overallSizeSaved, lastImageID, storeHash

#Only if you want to save in a DB
#$insertStatement = "INSERT INTO authentication(userID, userEmail, apiToken, storeHash) VALUES(?, ?, ?, ?)";
#$statement = $dbh->prepare($insertStatement);
#$statement->execute($jsonObject->{'user'}{'id'},$jsonObject->{'user'}{'email'}, $jsonObject->{'access_token'}, $jsonObject->{'context'});