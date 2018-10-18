# Sieve file for the account; see http://wiki2.dovecot.org/Pigeonhole/Sieve
# for details.

require ["fileinto", "copy"];

# Move all undeliverable email into an Undeliverable folder
if header :contains "subject" ["undeliverable", "undelivered"] {
    fileinto "Undeliverable";
    stop;
}

# Copy all incoming email into an Archive for additional processing (e.g. 
# spam/ham classification) and backup
fileinto :copy "Archive";

keep;
