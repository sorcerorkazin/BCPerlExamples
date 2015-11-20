#!/usr/bin/perl
use cPanelUserConfig;
use CGI;
use DBI;

my $q = CGI->new;
my %headers = map { $_ => $q->http($_) } $q->http();


$db = "sevillas_escalationstool";
$host = "localhost";
$user = "sevillas_admin";
$password = '';
$dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host", $user, $password) or die "Can't connect to database: $DBI::errstr\n";

$insertStatement = "INSERT INTO headers(line) VALUES (?)";
$statement = $dbh->prepare($insertStatement);

print $q->header('text/plain');
print "Got the following headers:\n";
for my $header ( keys %headers ) {
    $statement->execute("$header: $headers{$header}");
}
